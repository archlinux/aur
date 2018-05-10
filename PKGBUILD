# Maintainer: magiruuvelvet <contact (at) magiruuvelvet (dot) gdn>

# Note: use GCC to compile, clang doesn't work

pkgname=gimp-plugin-resynthesizer
_pkgname=resynthesizer
pkgver=2.0.3
pkgrel=1
pkgdesc="Suite of gimp plugins for texture synthesis"
arch=('x86_64')
url='https://github.com/bootchk/resynthesizer'
license=('GPL3')
depends=('gimp>=2.8' 'python')
makedepends=('pkg-config' 'intltool')
source=("$pkgname-src-$pkgver.tgz::https://github.com/bootchk/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('798678095c34b101c880eb350b31e9a6ff9748707d6ad9063cdee26c38016450')

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

    make prefix=/usr \
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
