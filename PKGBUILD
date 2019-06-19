# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=jsonnet
pkgver=0.13.0
pkgrel=2
pkgdesc='The data templating language'
arch=('x86_64')
url='https://jsonnet.org/'
license=('Apache')
depends=('gcc-libs')
checkdepends=('python2')
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz"
        "fix-test-failure.patch")

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/fix-test-failure.patch"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -fPIC -Iinclude" CXXFLAGS="$CXXFLAGS -fPIC -Iinclude -Ithird_party/md5 -Ithird_party/json" make jsonnet jsonnetfmt libjsonnet.so libjsonnet++.so
}

check() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -fPIC -Iinclude" make test
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/include"

  install -m755 jsonnet "$pkgdir/usr/bin/jsonnet"
  install -m755 jsonnetfmt "$pkgdir/usr/bin/jsonnetfmt"
  install -m755 libjsonnet.so "$pkgdir/usr/lib/libjsonnet.so"
  install -m755 libjsonnet++.so "$pkgdir/usr/lib/libjsonnet++.so"
  install -m644 include/libjsonnet.h "$pkgdir/usr/include/libjsonnet.h"
  install -m644 include/libjsonnet_fmt.h "$pkgdir/usr/include/libjsonnet_fmt.h"
  install -m644 include/libjsonnet++.h "$pkgdir/usr/include/libjsonnet++.h"
}

# vim: set ft=sh:

sha512sums=('d19e5398763e37b79b0ef02368f6bd6215d2df234b5ff7a6d98e2306a0d47290600061c9f868c0c262570b4f0ee9eee6c309bcc93937b12f6c14f8d12339a7d5'
            '905e95ae51c66e65ddc8761cf4c029c0912e61f4c19297e4b3d5da4df4c7c9d2fd365ea6b24bd6335a0fbe92e8252d8b1cf13155f19ee7b62faa502d92fb9771')
