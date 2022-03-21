# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sqlcheck
pkgver=1.3
pkgrel=1
pkgdesc="Automatically identify anti-patterns in SQL queries"
arch=('x86_64')
url="https://github.com/jarulraj/sqlcheck"
license=('Apache')
depends=('gcc-libs' 'gflags')
makedepends=('git' 'cmake')
checkdepends=('gtest')
conflicts=('sqlcheck-git')
_commit='ccb6c7daeb8adb89a47ffea0091667c7128f3736'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'use-system-libs.patch'
)
sha512sums=('SKIP'
            '8f6456e0a98ae50f3fa08adc9b4204f26c18372c7a30f381345404283c5f274acc5e437373c9d528f591b086e6f069bbd329c64fb3d0ec0c5cedcf8b757c9ad4')
b2sums=('SKIP'
        'f96d29f9d329faf36ab5ba4eff0de966b1f2288a146a05890c0d39dbacd9ef08fa0c62efbfa53326dc353ce393e543245d39d1428f198fae3530eb43a325907a')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"
  patch --forward --strip=1 --input="$srcdir/use-system-libs.patch"
}

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='None'

  make -C build sqlcheck
}

check() {
  make -C build test_suite test
}

package() {
  install -vDm755 -t "$pkgdir/usr/bin" build/bin/sqlcheck
}
