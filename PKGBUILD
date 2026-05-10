pkgname=ccusage-all
pkgver=18.0.11
pkgrel=1
pkgdesc='Usage analyzers for Claude Code, Codex, OpenCode, Amp, Pi, and ccusage MCP'
arch=('any')
url='https://github.com/ryoppippi/ccusage'
license=('MIT')
depends=('nodejs>=20.19.4')
makedepends=('bun' 'pnpm')
provides=('ccusage')
conflicts=('ccusage')
source=("ccusage-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf3878a6fe1f5ab6afdcd586fbb9abdc31c7ae131b0fbca7c4d1f914bff680a8')

_srcname='ccusage'
_apps=(
	'ccusage:ccusage'
	'amp:ccusage-amp'
	'codex:ccusage-codex'
	'mcp:ccusage-mcp'
	'opencode:ccusage-opencode'
	'pi:ccusage-pi'
)


prepare() {
	cd "${_srcname}-${pkgver}"

	pnpm install --frozen-lockfile --ignore-scripts --store-dir "${srcdir}/pnpm-store"
}

build() {
	cd "${_srcname}-${pkgver}"

	local app
	pnpm --filter './apps/ccusage' exec tsdown

	cat > apps/mcp/tsdown.pkg.config.ts <<'EOF'
import { builtinModules } from 'node:module';
import { defineConfig } from 'tsdown';

const nodeBuiltins = new Set([
	...builtinModules,
	...builtinModules.map((moduleName) => `node:${moduleName}`),
]);

export default defineConfig({
	entry: ['src/index.ts'],
	outDir: 'dist',
	format: 'esm',
	clean: true,
	sourcemap: false,
	minify: 'dce-only',
	treeshake: true,
	fixedExtension: false,
	dts: {
		tsgo: true,
	},
	publint: true,
	unused: true,
	exports: {
		devExports: true,
	},
	nodeProtocol: true,
	noExternal: (id) => !nodeBuiltins.has(id),
	define: {
		'import.meta.vitest': 'undefined',
	},
});
EOF

	for app in amp codex opencode pi; do
		pnpm --filter "./apps/${app}" run build
	done

	pnpm --filter './apps/mcp' exec tsdown --config tsdown.pkg.config.ts
}

package() {
	cd "${_srcname}-${pkgver}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}/apps"

	local entry app bin appdir target
	for entry in "${_apps[@]}"; do
		app="${entry%%:*}"
		bin="${entry##*:}"
		appdir="${pkgdir}/usr/lib/${pkgname}/apps/${app}"
		target="/usr/lib/${pkgname}/apps/${app}/dist/index.js"

		install -d "${appdir}"
		cp -a "apps/${app}/dist" "${appdir}/"
		install -Dm644 "apps/${app}/package.json" "${appdir}/package.json"

		if [[ -f "apps/${app}/README.md" ]]; then
			install -Dm644 "apps/${app}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/${app}.md"
		fi

		if [[ -f "apps/${app}/config-schema.json" ]]; then
			install -Dm644 "apps/${app}/config-schema.json" "${appdir}/config-schema.json"
		fi

		cat > "${pkgdir}/usr/bin/${bin}" <<EOF
#!/bin/sh
exec node ${target} "\$@"
EOF
		chmod 755 "${pkgdir}/usr/bin/${bin}"
	done
}
