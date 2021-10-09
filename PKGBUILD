# Contributor: MCMic <come@chilliet.eu>
# Contributor: Jonas Karlsson

pkgname=puzzlemoppet-git
pkgver=r124.8ba417c
pkgrel=1
pkgdesc="A challenging 3D puzzle game where you must guide the Moppet through the vast and eternal void of space by solving the various and beautiful puzzles thrown at you"
arch=('i686' 'x86_64')
url="https://github.com/karjonas/Puzzle-Moppet"
license=('WTFPL')
depends=('irrlicht' 'ode' 'openal')
makedepends=('make' 'cmake' 'git' 'gendesk')
conflicts=('puzzle-moppet-bin')
source=(${pkgname}::git+https://github.com/karjonas/Puzzle-Moppet.git)
md5sums=('SKIP')
_name='Puzzle Moppet'
_categories='Game;PuzzleGame'

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}"
    # Generate desktop file
    gendesk -n -f ../PKGBUILD
}

build() {
    cd "${srcdir}/${pkgname}"
    cmake -DBUILD_FOR_PKGBUILD=On -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_FOR_INSTALL=ON .
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make install DESTDIR=$pkgdir
    install -Dm644 "${srcdir}/puzzlemoppet.desktop" "${pkgdir}/usr/share/applications/puzzlemoppet.desktop"
    install -Dm644 "icons/main.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/puzzlemoppet.png"
}
