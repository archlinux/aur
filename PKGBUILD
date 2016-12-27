_pkgname=lugaru
_gitname=lugaru

pkgname=$_pkgname-git
pkgver=3327059
pkgrel=1
pkgdesc="A third-person action game featuring a unique close-range combat system"
url="https://osslugaru.gitlab.io"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl2' 'glu' 'libjpeg-turbo' 'libpng' 'openal' 'libvorbis' 'zlib')
makedepends=('cmake')
conflicts=('lugaru-hg')
source=("git+https://gitlab.com/osslugaru/lugaru.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            'c97bbd82701c07692f35fd86d0a4b4fdb2d5380a5672dde75617ae15389bfd15')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
            
build() {
    cd $srcdir/${_pkgname}/
    mkdir build
    cd build
    cmake -DSYSTEM_INSTALL=ON \
        -DCMAKE_INSTALL_BINDIR=games \
        -DCMAKE_INSTALL_DATADIR=share/games \
        -DCMAKE_INSTALL_MANDIR=../man \
        ..
    make
}
package() {
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    cd $srcdir/${_pkgname}/build
    make DESTDIR="$pkgdir/" install

}
