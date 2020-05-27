# Maintainer: Lorian Coltof <loriancoltof@gmail.com>

pkgname=codegrade-fs-electron
pkgver=1.1.2
pkgrel=1
pkgdesc="Electron frontend for the CodeGrade filesystem"
arch=('x86_64')
license=('AGPL3')

url="https://codegrade.com"
depends=('python-codegrade-fs' 'c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3')
makedepends=('git' 'npm' 'python')
source=("$pkgname-$pkgver::git+https://github.com/CodeGra-de/CodeGra.fs.git#commit=50d99b53fe6043382ed514377394f73d6335191f")
sha256sums=('SKIP')
install=codegrade-fs-electron.install

prepare() {
    cd $pkgname-$pkgver

    # Output Pacman archive instead of .deb
    sed -i '96s/deb/pacman/' package.json

    npm install
}

build() {
    cd $pkgname-$pkgver

    npm run build:linux:x64
}

package() {
    cd $pkgname-$pkgver

    tar -C "${pkgdir}/" -xf dist/codegrade-fs-${pkgver}.pacman
    rm "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE"

    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
