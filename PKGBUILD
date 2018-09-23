_pkgname=lugaru
_gitname=lugaru

pkgname=$_pkgname-git
pkgver=r968.efdb8d8
pkgrel=1
pkgdesc="A third-person action game featuring a unique close-range combat system"
url="https://osslugaru.gitlab.io"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl2' 'glu' 'libjpeg-turbo' 'libpng' 'openal' 'libvorbis' 'zlib')
makedepends=('cmake')
conflicts=('lugaru-hg' 'lugaruhd-hg' 'lugaru')
source=("git+https://gitlab.com/osslugaru/lugaru.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            'c97bbd82701c07692f35fd86d0a4b4fdb2d5380a5672dde75617ae15389bfd15')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
            
build() {
    cd $srcdir/${_pkgname}/
    mkdir build || true
    cd build
    cmake -DSYSTEM_INSTALL=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DCMAKE_INSTALL_DATADIR=share \
        -DCMAKE_INSTALL_MANDIR=share/man \
        ..
    make
}
package() {
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    cd $srcdir/${_pkgname}/build
    make DESTDIR="$pkgdir/" install

}
