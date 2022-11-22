# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=lokinet-gui
pkgver=1.0.0
pkgrel=2
pkgdesc="Graphical user interface for lokinet"
arch=('i686' 'x86_64')
url="https://github.com/oxen-io/lokinet-gui"
options=(!strip)
makedepends=('nodejs' 'libxcrypt-compat')
source=("https://github.com/oxen-io/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" "git-config" "lokinet-gui.desktop")
sha256sums=('e0919464e64540a3f573ace4dfaa93d00a5d13daa754d6c054befcb882f855a0'
            'c42bf520ceb87783604e50fd6a3145eea34e8d6ff244bfbb77540cac2415f447'
            'cd672a5ccc287bb6dbc4e1403bb28d08d14f4538fda286e46f3949659f67fc26')

build() {
  cd "$pkgname-$pkgver"

	# Build requires a working .git config.
	mkdir -p .git
	cp ../git-config .git/config

	# Build the AppImage
	yarn install --frozen-lockfile
	yarn appImage
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm 775 "release/Lokinet-GUI-${pkgver}.AppImage" "${pkgdir}/usr/bin/Lokinet-GUI.AppImage"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 755 "${srcdir}"/lokinet-gui.desktop "${pkgdir}/usr/share/applications/lokinet-gui.desktop"
	install -Dm 644 "images/lokinet-logo-white.png" "${pkgdir}/usr/share/icons/lokinet-gui.png"
}
