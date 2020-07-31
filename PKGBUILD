# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-faustgen
pkgver=0.1.1
pkgrel=1
pkgdesc="The FAUST compiler embedded in a Pd external"
arch=("i686" "x86_64")
license=('MIT')
url="https://github.com/CICM/$pkgname"
depends=('pd' 'llvm-libs')
makedepends=('cmake' 'llvm')
source=("git+https://github.com/CICM/$pkgname.git#tag=v$pkgver"
	"faust@341bd3c5-patch.diff")
md5sums=('SKIP'
         '99f845fe8a258a8185577beae6ff67d9')

prepare() {
     cd "$pkgname"
     git submodule update --init --recursive
     # patch up the Faust source for LLVM10 support
     patch -d faust -N -p1 -i "$srcdir/faust@341bd3c5-patch.diff"
     mkdir build && cd build && cmake ..
}

build() {
     cd "$pkgname/build"
     make
}

package() {
     cd "$pkgname"
     mkdir -p "$pkgdir/usr/lib/pd/extra/faustgen~/libs"
     cp -a external/* "$pkgdir/usr/lib/pd/extra/faustgen~"
     cp -a faust/libraries/* "$pkgdir/usr/lib/pd/extra/faustgen~/libs"
}
