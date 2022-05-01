# -*- mode: Shell-script; eval: (setq tab-width 2); eval: (setq indent-tabs-mode nil) -*-
# Maintainer: Dominic Meiser <git at msrd0 dot de>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-brotli-static
_pkgname=brotli
_gitcommit=e61745a6b7add50d380cfd7d3883dd6c62fc2c71
pkgver=1.0.9
pkgrel=1
pkgdesc='Brotli compression library (mingw-w64)'
arch=('any')
license=('MIT')
url='https://github.com/google/brotli'
depends=('mingw-w64-gcc')
makedepends=('mingw-w64-cmake' 'git')
provides=("mingw-w64-brotli=$pkgver")
conflicts=("mingw-w64-brotli")
options=('!buildflags' '!strip' 'staticlibs')
source=(${_pkgname}::"git+${url}#commit=${_gitcommit}"
        '0001-cmake-static-libs.patch'
        '0002-cmake-no-exe.patch')
sha512sums=('SKIP'
            '23d807f6563fc33720af074cc0996e332da9ee7aa7b45c958ec94e75da34b1947bff0ec05b8db8613d413e344f00b694c983d6a0578dc11dc722cb2feda7d2df'
            '8b340ec3a6fc3e88e8a338cc3f2358f100e22ceda70207d511660fd5e7a68fe9502e3a15bfa6ed6197281f7f8d830c5737159f1323a2660a0536c6085f60ea59')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/0001-cmake-static-libs.patch"
  patch -Np1 -i "$srcdir/0002-cmake-no-exe.patch"
}

build() {
  for _arch in $_architectures; do
    cd "$srcdir/$_pkgname"
    mkdir -p build-$_arch
    pushd build-$_arch
    $_arch-cmake -DBROTLI_DISABLE_TESTS=ON ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir/$_pkgname/build-$_arch"
    make DESTDIR="$pkgdir" install
    $_arch-strip -g "$pkgdir"/usr/$_arch/lib/*.a
  done
  for file in "${pkgdir}"/usr/*/lib/pkgconfig/*.pc; do
    sed -i 's| -R${libdir}||g' "$file"
  done
}
