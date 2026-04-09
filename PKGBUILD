# Maintainer: Juan Roa <hello@juanroa.dev>
pkgname=athas
pkgver=0.4.4
pkgrel=1
pkgdesc="Lightweight code editor built with React, TypeScript, and Tauri"
arch=('x86_64' 'aarch64')
url="https://athas.dev"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('bun' 'cmake' 'npm' 'rust')
conflicts=('athas-bin')
_source_name=athas
source=("${_source_name}-${pkgver}.tar.gz::https://github.com/athasdev/athas/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('73e91ca7668a8f7b1eadf538e87a31d6d67c333e20d99b3effd2789a493b6646')

_builddir="${_source_name}-${pkgver}"

latestver() {
	gh api --paginate repos/athasdev/athas/tags --jq '.[].name' |
		sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' |
		sort -V |
		tail -1
}

prepare() {
	cd "${_builddir}"

	local cargo_home="${srcdir}/cargo"

	export CARGO_HOME="${cargo_home}"
	mkdir -p "${cargo_home}"
}

build() {
	cd "${_builddir}"

	local cargo_home="${srcdir}/cargo"
	local cargo_target="${srcdir}/target"
	local ts_cli_arch
	local ts_cli_version
	local swift_ts_cli_version

	export CFLAGS="${CFLAGS/-flto=auto/}"
	export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
	export LDFLAGS="${LDFLAGS/-flto=auto/}"
	export CARGO_HOME="${cargo_home}"
	export CARGO_TARGET_DIR="${cargo_target}"
	export npm_config_fetch_retries=5
	export npm_config_fetch_retry_maxtimeout=300000
	export npm_config_fetch_retry_mintimeout=20000
	export CXXFLAGS="${CXXFLAGS} -std=gnu++20"

	npm install --legacy-peer-deps --install-strategy=nested --ignore-scripts
	npm install --legacy-peer-deps --install-strategy=nested --no-save \
		nanoid@5.1.7 \
		vscode-languageserver-types@3.17.5 \
		tailwindcss@4.2.2 \
		pdfjs-dist@5.6.205

	case "${CARCH}" in
		x86_64) ts_cli_arch=x64 ;;
		aarch64) ts_cli_arch=arm64 ;;
		*) printf 'Unsupported architecture for tree-sitter-cli bootstrap: %s\n' "${CARCH}" >&2; return 1 ;;
	 esac

	ts_cli_version=$(node -p "require('./node_modules/tree-sitter-cli/package.json').version")
	curl -fL "https://github.com/tree-sitter/tree-sitter/releases/download/v${ts_cli_version}/tree-sitter-linux-${ts_cli_arch}.gz" -o node_modules/tree-sitter-cli/tree-sitter.gz
	gunzip -f node_modules/tree-sitter-cli/tree-sitter.gz
	chmod 755 node_modules/tree-sitter-cli/tree-sitter

	swift_ts_cli_version=$(node -p "require('./node_modules/tree-sitter-swift/node_modules/tree-sitter-cli/package.json').version")
	if [[ "${swift_ts_cli_version}" != "${ts_cli_version}" ]]; then
		curl -fL "https://github.com/tree-sitter/tree-sitter/releases/download/v${swift_ts_cli_version}/tree-sitter-linux-${ts_cli_arch}.gz" -o node_modules/tree-sitter-swift/node_modules/tree-sitter-cli/tree-sitter.gz
		gunzip -f node_modules/tree-sitter-swift/node_modules/tree-sitter-cli/tree-sitter.gz
		chmod 755 node_modules/tree-sitter-swift/node_modules/tree-sitter-cli/tree-sitter
	fi

	npm rebuild tree-sitter-swift
	bun scripts/postinstall.ts
	npm run typecheck
	npx vite build
	cargo build --release --locked --manifest-path src-tauri/Cargo.toml --bin athas
}

package() {
	cd "${_builddir}"

	local cargo_target="${srcdir}/target"

	install -Dm755 "${cargo_target}/release/athas" "${pkgdir}/usr/bin/${pkgname}"
	install -d "${pkgdir}/usr/lib/Athas"
	cp -r src/extensions/bundled "${pkgdir}/usr/lib/Athas/"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 src-tauri/icons/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	install -Dm644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	install -Dm644 src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
	install -Dm644 src-tauri/icons/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Athas
Comment=Lightweight code editor built with Tauri
Exec=athas %U
Icon=athas
Terminal=false
Categories=Development;IDE;
EOF
}
