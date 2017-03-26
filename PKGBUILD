# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=frei0r-plugins-git
pkgver=1.5.r5.gb63f5db
pkgrel=5
pkgdesc="A minimalistic plugin API for video sources and filters (Git version)"
arch=('i686' 'x86_64')
url="https://www.dyne.org/software/frei0r/"
license=('GPL2')
depends=('gcc-libs' 'gavl' 'cairo' 'opencv')
makedepends=('git')
provides=('frei0r-plugins')
conflicts=('frei0r-plugins')
source=("$pkgname"::'git+https://github.com/dyne/frei0r.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    _tmppkgver=$(printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')")
    if [ "$(echo ${_tmppkgver} | head -c1)" = "v" ]; then
        echo "$_tmppkgver" | cut -c2-
    else
        echo "$_tmppkgver"
    fi
}

build() {
    cd "$pkgname"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --enable-static=no \
        --enable-shared=yes \
        --enable-fast-install=yes \
        --enable-cpuflags
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
