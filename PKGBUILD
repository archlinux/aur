# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=codechecker
pkgver=6.26.2
pkgrel=1
pkgdesc="Analyzer tooling, defect database and viewer extension for the Clang Static Analyzer and Clang Tidy"
arch=(x86_64)
url="https://github.com/Ericsson/codechecker"
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  npm
  python-pip
)
optdepends=(
  'clang: for running Clang Static Analyzer and Clang Tidy'
  'cppcheck: for running CPPCheck analysis'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "fix-ldflags.patch"
)
sha256sums=(
  'fc72351fa0ed511b82c5ebd6c39a6f2d100c4340dd6e90c043c468ba892e584e'
  'e59cb4d96642ccea7c3536e020b3961c1717bc65983424ced48b0ae1b1a3871a'
)

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < ../fix-ldflags.patch
}

build() {
  cd $pkgname-$pkgver
  make venv
  # shellcheck disable=SC1091
  source "$PWD/venv/bin/activate"
  pip install setuptools

  # Parallel builds fail
  export MAKEFLAGS="-j1"
  export BUILD_LOGGER_64_BIT_ONLY=YES
  make package

  tar -xf web/api/py/codechecker_api/dist/codechecker_api.tar.gz
  tar -xf web/api/py/codechecker_api_shared/dist/codechecker_api_shared.tar.gz
}

package() {
  cd $pkgname-$pkgver
  install -vdm755 "$pkgdir/opt"
  cp -va build/CodeChecker "$pkgdir/opt"
  rm -vr "$pkgdir/opt/CodeChecker/lib/python3/codechecker"

  cp -vr venv/lib/python*/site-packages/* "$pkgdir/opt/CodeChecker/lib/python3/"

  cp -va codechecker_api-*/codechecker_api/ "$pkgdir/opt/CodeChecker/lib/python3/"
  cp -va codechecker_api_shared-*/codechecker_api_shared/ "$pkgdir/opt/CodeChecker/lib/python3/"

  install -vdm755 "$pkgdir/usr/bin"
  ln -vs /opt/CodeChecker/bin/CodeChecker "$pkgdir/usr/bin/CodeChecker"
}
