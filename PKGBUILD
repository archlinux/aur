# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Thomas Sowell <tom@fancydriving.org>
# Contributor: Joseph Riches

pkgname=libgestures
pkgdesc="Chromium OS gestures library"
pkgver=2.0.3
pkgrel=5
arch=(i686 x86_64)
url="http://github.com/galliumos/libgestures"
license=('custom:chromiumos')
provides=('libgestures=$pkgver')
depends=('jsoncpp')
makedepends=('git')

source=("$pkgname::git+https://github.com/galliumos/libgestures.git"
	"cmath_everywhere.patch"
	"class_memaccess_noerror.patch")

sha256sums=('SKIP'
            '4ce7bd11ba4b5aa4b5328f5c4a4dd6f59e283427ebd73a462ee526f6779f63d9'
            'db56ab1d0375765fe5ffe3bec72e6e7f662b035155fdc62f1f7e2c9ae3f01989')

prepare() {
  cp "$srcdir"/cmath_everywhere.patch "$srcdir/$pkgname"
  cp "$srcdir"/class_memaccess_noerror.patch "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
  patch -p1 < cmath_everywhere.patch
  patch -p1 < class_memaccess_noerror.patch
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  make -C "$srcdir/$pkgname" DESTDIR="${pkgdir}" install
  rm -fr ${pkgdir}/etc

  install -m 644 -D ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/license/${pkgname}/LICENSE
}
