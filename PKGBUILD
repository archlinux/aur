# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=codechecker
pkgver=6.21.0
pkgrel=1
pkgdesc="Analyzer tooling, defect database and viewer extension for the Clang Static Analyzer and Clang Tidy"
arch=(x86_64)
url="https://github.com/Ericsson/codechecker"
license=(Apache)
makedepends=(python-setuptools)
depends=(
  python-pyyaml
  python-alembic
  python-gitpython
  python-lxml
  python-mypy_extensions
  python-portalocker
  python-psutil
  python-thrift
)
optdepends=(
  'clang: for running Clang Static Analyzer and Clang Tidy'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "fix-ldflags.patch"
)
sha256sums=(
  '3c3ace15275dacb81d3fd7f004a96e7e230ffde4bfa125a7c4f7697d2b360c34'
  'e59cb4d96642ccea7c3536e020b3961c1717bc65983424ced48b0ae1b1a3871a'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="${srcdir}/fix-ldflags.patch"
}

build() {
  cd "$_archive"

  export BUILD_LOGGER_64_BIT_ONLY=YES
  export BUILD_UI_DIST=NO
  make package
}

package() {
  cd "$_archive"

  install -dm755 $pkgdir/opt
  cp -r build/CodeChecker $pkgdir/opt
  rm -r $pkgdir/opt/CodeChecker/lib/python3/codechecker

  install -dm755 $pkgdir/usr/bin
  ln -s /opt/CodeChecker/bin/CodeChecker $pkgdir/usr/bin/CodeChecker
}
