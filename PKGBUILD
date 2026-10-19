# Maintainer: RiverOnVenus <aur@zhui.dev>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
_pkgname=delance-runtime
_pylance_sha256=5e3900dfddad61f8830cf7d7fab08b06d07f18d3ddc953662c851e518cc6d3f1
pkgname=delance-langserver
pkgver=2026.3.102
pkgrel=1
pkgdesc="A spear to the Python language server built with black magic"
arch=('x86_64')
url="https://sr.ht/~self/delance/"
license=('0BSD')
depends=(glibc nodejs)
optdepends=(
    'python: Pylance Python language features'
    'python-pytest: pytest option discovery'
    'python-numpy: NumPy type stubs support'
)
makedepends=(deno npm)
source=("${_pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~self/${_pkgname}/archive/v${pkgver}.tar.gz"
	'use-delance-builder-0.4.3.patch')
sha256sums=('fa74bd430fd9ce01698ccfeaee157f0c3ac1d1857061c15c2c10b415b35de7ef'
	'2ad42544fb9b04c588de011d45d618ecde7363082a918c221c897da4db58b56d')

prepare() {
	cd "$_pkgname-v$pkgver"
	# Pylance 2026.3.102 dropped the deprecation warning array that
	# @delance/builder 0.4.2 expects; 0.4.3 handles both layouts.
	patch -Np1 -i "${srcdir}/use-delance-builder-0.4.3.patch"
}

build() {
	cd "$_pkgname-v$pkgver"

	# Bundle JS with esbuild (uses deno to resolve JSR deps)
	deno run --allow-all build.mts

	# Install @zip.js/zip.js (the only external dep needed by install.mjs)
	cd out
	npm install --omit=dev

	# Download Pylance extension from VS Code Marketplace
	node --input-type=module -e "import { install } from './install.mjs'; await install(new URL('./dist/v${pkgver}-${_pylance_sha256}/', import.meta.url));"
}

package() {
	cd "$_pkgname-v$pkgver/out"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	# Copy Pylance dist contents flat into /usr/share/<pkg>/
	cp -r "dist/v${pkgver}-"*/ "${pkgdir}/usr/share/${pkgname}"
	cd "${pkgdir}/usr/share/${pkgname}"

	# Strip non-x86_64 platform binaries (bundled Pylance ships all platforms)
	rm -rf bundled/bin/{darwin-arm64,linux-arm64,win32-arm64,win32-x64} 2>/dev/null || true

	rm -f browser.*.LICENSE.txt

	local _licenses=(*.LICENSE.txt)
	if [[ -f "${_licenses[0]}" ]]; then
		install -Dm644 "${_licenses[@]}" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
		rm "${_licenses[@]}"
	fi

	# Create launcher wrapper
	install -dm755 "${pkgdir}/usr/bin/"
	install -Dm755 /dev/stdin "${pkgdir}/usr/share/${pkgname}/langserver.cjs" <<"EOF"
#!/usr/bin/node

require('./server.bundle.js');
EOF

	ln -s "../share/${pkgname}/langserver.cjs" "${pkgdir}/usr/bin/${pkgname}"
}
