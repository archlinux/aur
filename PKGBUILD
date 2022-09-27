# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=punes-git
pkgver=0.109.r1848.46ff1d83
pkgrel=1
pkgdesc="Nintendo Entertaiment System emulator"
arch=('x86_64')
url="https://github.com/punesemu/puNES"
license=('GPL2')
depends=('alsa-lib' 'desktop-file-utils' 'ffmpeg' 'hicolor-icon-theme' 'nvidia-cg-toolkit' 'libxrandr' 'qt5-base' 'qt5-svg')
makedepends=('cmake' 'git' 'glu' 'qt5-tools')
conflicts=('punes')
provides=('punes')
source=("git+https://github.com/punesemu/puNES.git")
md5sums=('SKIP')

#breaks internal lib7zip
options=('!buildflags')

pkgver() {
    cd puNES
    printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags | sed 's/v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}"/puNES
    sed -e 's:^\tupdate-desktop-database.*$:\ttrue:' -i 'misc/Makefile.am'
}

build() {
    cd "${srcdir}"/puNES
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}"/puNES
    make DESTDIR="${pkgdir}" install
}
