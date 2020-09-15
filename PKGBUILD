# Maintainer: Lorian Coltof <loriancoltof@gmail.com>

pkgname=codegrade-fs-electron
pkgver=1.1.2
pkgrel=2
pkgdesc="Electron frontend for the CodeGrade filesystem"
arch=('x86_64')
license=('AGPL3')

url="https://codegrade.com"
depends=('python-codegrade-fs' 'gtk3' 'libxss' 'nss' 'libnotify')
makedepends=('git' 'npm' 'python')
source=("$pkgname-$pkgver::git+https://github.com/CodeGra-de/CodeGra.fs.git#commit=50d99b53fe6043382ed514377394f73d6335191f"
        build-pacman.patch)
sha256sums=(
        'SKIP'
        'efcb4ecdd9e849434c42374ae5c6376a7c72a79794b51209fc8148a842c7384e')
install=codegrade-fs-electron.install

prepare() {
    cd $pkgname-$pkgver

    # Output Pacman archive instead of .deb
    patch -Np1 -i "${srcdir}/build-pacman.patch"

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
