# Maintainer: Chris Kitching <chriskitching@linux.com>

pkgname=python2-llvm-lit
pkgver=6.0.1
pkgrel=1
pkgdesc="LLVM integrated tester"
arch=('any')
depends=(python2 python2-pip)
source=(
  "https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz"
  versioning.patch
)
md5sums=(
  'c88c98709300ce2c285391f387fecce0'
  '9f54e688dd2028c9bfa861f67607f3e4'
)

prepare() {
  cd llvm-$pkgver.src
  # Patch to cope with silly Python package versioning.
  # llvm-lit is hardcoded to append `-dev` to the Python package version. Python versioning
  # rules say that version 0.6.0-dev < 0.6.0, so downstream packages like lnt fail because
  # the installed version of llvm-lit is "too old".
  patch -p1 < $srcdir/versioning.patch
}

build() {
  cd "llvm-$pkgver.src/utils/lit"
  python2 setup.py build
}

package() {
  cd "llvm-$pkgver.src/utils/lit"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
