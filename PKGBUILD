# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-faustgen2
prjname=pd-faustgen
pkgver=2.0.2
pkgrel=2
pkgdesc="The FAUST compiler embedded in a Pd external"
arch=("i686" "x86_64")
license=('MIT')
url="https://github.com/agraef/$prjname"
depends=('pd' 'llvm-libs')
makedepends=('faust' 'cmake' 'llvm')
source=("https://github.com/agraef/$prjname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
	"faust-api-breakage.diff")
md5sums=('1f1304a9790ee127e2f59ce92812c5d7'
         'a9d2cdb5d664a8c9954b1b09fcb7b22f')

prepare() {
     cd "$pkgname-$pkgver"
     # Work around recent API breakage in Faust version 2.37.3 and later. This
     # should really be fixed upstream in pd-faustgen2 using some cmake magic,
     # but this will do for now. Thanks to Björn Kessler for spotting this and
     # contributing the patch.
     patch -p1 -i ../faust-api-breakage.diff
}

build() {
     cd "$pkgname-$pkgver"
     mkdir build && cd build
     cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DINSTALLED_FAUST=ON
     make
}

package() {
     cd "$pkgname-$pkgver/build"
     make install DESTDIR="$pkgdir"
}
