# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=lokinet-gui
pkgver=1.0.1
pkgrel=0
pkgdesc="Graphical user interface for lokinet"
arch=('i686' 'x86_64')
url="https://github.com/oxen-io/lokinet-gui"
options=(!strip)
makedepends=('nodejs' 'libxcrypt-compat' 'yarn')
source=("https://github.com/oxen-io/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" "git-config" "lokinet-gui.desktop")
sha256sums=('1e452b7bc3ce193bfc91e7681a88a78ca872073f873d37a8fe6c0a33c38fcd49'
            'c42bf520ceb87783604e50fd6a3145eea34e8d6ff244bfbb77540cac2415f447'
            '1116ac3773bf24afd9d04d42809b3390d9aa7893717e2e1230852f5de50bcace')

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

	install -Dm 775 "release/Lokinet-GUI-1.0.0.AppImage" "${pkgdir}/usr/bin/Lokinet-GUI.AppImage"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm 755 "${srcdir}"/lokinet-gui.desktop "${pkgdir}/usr/share/applications/lokinet-gui.desktop"
	install -Dm 644 "images/lokinet-logo-white.png" "${pkgdir}/usr/share/icons/lokinet-gui.png"
}
