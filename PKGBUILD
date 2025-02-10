# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=cadical
pkgver=2.1.3
pkgrel=1
pkgdesc="Simple CDCL satisfiability solver"
arch=('x86_64')
url="https://fmv.jku.at/cadical/"
license=('MIT')
depends=('gcc-libs' 'glibc')
source=("https://github.com/arminbiere/cadical/archive/rel-$pkgver.tar.gz")
b2sums=('fe52011a072ded2897300b5c1a2a0c56647f8bd334ac4b78c4e7e3ac063963309229cd4c20f571dc8d7ed1165e4952d9bfbc79b46f3cf51d3f80d052ef856003')
options=('!lto')

build() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  ./configure -l # include code to really see what the solver is doing
  make CXXFLAGS+="${CXXFLAGS} -fPIC"
}

check() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 BUILD.md "$pkgdir/usr/share/doc/$pkgname/BUILD.md"
  install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 NEWS.md "$pkgdir/usr/share/doc/$pkgname/NEWS.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd src
  install -Dm644 ccadical.h  "$pkgdir/usr/include/ccadical.h"
  install -Dm644 cadical.hpp  "$pkgdir/usr/include/cadical.hpp"

  cd ../build
  install -Dm755 cadical      "$pkgdir/usr/bin/cadical"
  install -Dm755 mobical      "$pkgdir/usr/bin/mobical"
  install -Dm644 libcadical.a "$pkgdir/usr/lib/libcadical.a"
}
