# Maintainer: Agampreet
# Contributor: Agampreet
pkgname=ms-office-electron-git
pkgver=0.3.2
pkgrel=1
pkgdesc="An Unofficial Microsoft Office Online Desktop Client. Free of Cost."
arch=('x86_64')
url="https://github.com/agam778/MS-Office-Electron"
license=('MIT')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs' 'xdg-utils')
makedepends=('git' 'yarn')
provides=("${pkgname%-git}" 'MS-Office-Electron')
conflicts=("${pkgname%-git}" 'MS-Office-Electron')
source=("${pkgname%-git}::git+https://github.com/agam778/MS-Office-Electron.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname%-git}"
    export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
    yarn install
    yarn electron-builder -l deb
}

package() {
    cd "$srcdir/${pkgname%-git}"
    bsdtar -xf "${srcdir}/${pkgname%-git}/release/MS-Office-Electron-Setup-0.3.2-x86_64.deb" -C "${srcdir}" --include data.tar.bz2
    bsdtar -xf ${srcdir}/data.tar.bz2 -C ${pkgdir}
	install -d ${pkgdir}/usr/bin/
	ln -s /opt/MS-Office-Electron/MS-Office-Electron ${pkgdir}/usr/bin/MS-Office-Electron
	install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/MS-Office-Electron.png"  "${pkgdir}/usr/share/pixmaps/MS-Office-Electron.png"
	rm -rfv "${pkgdir}/usr/share/icons/hicolor"
}
