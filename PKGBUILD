# Maintainer: magiruuvelvet <contact (at) magiruuvelvet (dot) gdn>

# Note: use GCC to compile, clang doesn't work

pkgname=gimp-plugin-resynthesizer
_pkgname=resynthesizer
pkgver=2.0.2
pkgrel=2
pkgdesc="Suite of gimp plugins for texture synthesis"
arch=('x86_64')
url='https://github.com/bootchk/resynthesizer'
license=('GPL3')
depends=('gimp>=2.8.x' 'python')
makedepends=('pkg-config' 'intltool')
source=("$pkgname-src-$pkgver.tgz::https://github.com/bootchk/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('ef8d8137c43cba0a712cf1f9c6891e8606d4b8af9b218cea0efcaa7797aa0a87')

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    # make sure GCC is selected during config
    export CC=gcc
    export CXX=g++

    ./autogen.sh
    ./configure --prefix=/usr \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib/gimp-2.0

    make -j8 prefix=/usr \
        bindir=/usr/bin \
        sbindir=/usr/bin \
        libdir=/usr/lib \
        libexecdir=/usr/lib/gimp-2.0 \
        DESTDIR="${pkgdir}"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    make prefix=/usr \
        bindir=/usr/bin \
        sbindir=/usr/bin \
        libdir=/usr/lib \
        libexecdir=/usr/lib/gimp-2.0 \
        DESTDIR="${pkgdir}" install

    # Stupid Makefile, not install things correctly, help?
    mkdir -p "$pkgdir/usr/lib/gimp/2.0/plug-ins/"
    mv "$pkgdir/usr/bin/"* "$pkgdir/usr/lib/gimp/2.0/plug-ins/"
    rmdir "$pkgdir/usr/bin"
}
