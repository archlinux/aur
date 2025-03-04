# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>
pkgname=emv-utils-git
_pkgname=emv-utils
pkgver=0.2.1.r0.g4b3da31
pkgrel=2
pkgdesc='Libraries and tools for EMV card data'
arch=(x86_64 i686 pentium4 armv7h aarch64)
url='https://github.com/openemv/emv-utils'
license=(LGPL-2.1-only)
depends=(boost-libs gcc-libs glibc iso-codes json-c pcsclite qt6-base)
makedepends=(boost cmake doxygen git)
optdepends=(bash-completion)
provides=(emv-utils)
source=("$_pkgname::git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cmake -S "$_pkgname" -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=YES \
    -DBUILD_DOCS=YES \
    -DBUILD_EMV_DECODE=YES \
    -DBUILD_EMV_TOOL=YES \
    -DBUILD_EMV_VIEWER=YES \
    -DQT_DIR=/usr/lib/cmake/Qt6
  cmake --build build
}

check() {
  local ctest_flags=(
    --test-dir build
    # show the stdout and stderr when the test fails
    --output-on-failure
    # execute tests in parallel
    --parallel $(nproc)
  )
  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D -m 644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
