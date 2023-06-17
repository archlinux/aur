# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=codechecker
pkgver=6.22.2
pkgrel=1
pkgdesc="Analyzer tooling, defect database and viewer extension for the Clang Static Analyzer and Clang Tidy"
arch=(x86_64)
url="https://github.com/Ericsson/codechecker"
license=(Apache)
depends=(
  glibc
  gcc-libs
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
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "fix-ldflags.patch"
  # Had to compress the patch due to its size. Submitted issue to fix the issue
  # to upstream:https://github.com/Ericsson/codechecker/issues/3967 
  "update-node-dependencies-vue-cli.patch.gz"
)
sha256sums=(
  '38cad940520f092fe57165841111efa945a0c5bf8047581adead52047bf716cd'
  'e59cb4d96642ccea7c3536e020b3961c1717bc65983424ced48b0ae1b1a3871a'
  '13e38f3cd2ec4301bfd1206b1c5107feb388f8f87ed39596eb91077a95aae7fa'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="${srcdir}/fix-ldflags.patch"

  cp "${srcdir}/update-node-dependencies-vue-cli.patch.gz" .
  gunzip update-node-dependencies-vue-cli.patch.gz
  patch --forward --strip=1 --input=update-node-dependencies-vue-cli.patch
}

build() {
  cd "$_archive"

  make venv
  # shellcheck disable=SC1091
  source "$(pwd)/venv/bin/activate"

  # Parallel builds fail
  export MAKEFLAGS="-j1"
  export BUILD_LOGGER_64_BIT_ONLY=YES
  make package

  tar -xf web/api/py/codechecker_api/dist/codechecker_api.tar.gz
  tar -xf web/api/py/codechecker_api_shared/dist/codechecker_api_shared.tar.gz
}

package() {
  cd "$_archive"

  install -dm755 "$pkgdir/opt"
  cp -r build/CodeChecker "$pkgdir/opt"
  rm -r "$pkgdir/opt/CodeChecker/lib/python3/codechecker"

  cp -r venv/lib/python*/site-packages/* "$pkgdir/opt/CodeChecker/lib/python3/"

  cp -r codechecker_api-*/codechecker_api/ "$pkgdir/opt/CodeChecker/lib/python3/"
  cp -r codechecker_api_shared-*/codechecker_api_shared/ "$pkgdir/opt/CodeChecker/lib/python3/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/CodeChecker/bin/CodeChecker "$pkgdir/usr/bin/CodeChecker"
}
