# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname=micropython
pkgname=$_pkgname-git
pkgver=1.25.0.r33.g611d8f9ce8
pkgrel=1
epoch=1
pkgdesc='A Python implementation for microcontrollers and constrained systems (UNIX git version)'
arch=(x86_64)
url='https://micropython.org/'
license=(MIT)
depends=(glibc libffi)
makedepends=(git python)
checkdepends=(python)
provides=($_pkgname mpy-cross)
conflicts=($_pkgname mpy-cross)
optdepends=('mpremote: to install micropython-lib and third-party modules')
source=("$_pkgname::git+https://github.com/micropython/$_pkgname.git"
        'berkeley-db-1.xx::git+https://github.com/micropython/berkeley-db-1.xx.git'
        'libffi::git+https://github.com/libffi/libffi.git'
        'mbedtls::git+https://github.com/ARMmbed/mbedtls.git'
        'micropython-lib::git+https://github.com/micropython/micropython-lib.git'
)
changelog='ChangeLog'
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed "s/-preview//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

prepare() {
  cd $_pkgname
  for submodule in berkeley-db-1.xx libffi mbedtls micropython-lib; do
    git submodule init lib/$submodule
    git submodule set-url lib/$submodule "$srcdir"/$submodule
    git -c protocol.file.allow=always submodule update lib/$submodule
  done
}

build() {
  cd $_pkgname/mpy-cross
  make
  cd ../ports/unix
  make
}

check() {
  cd $_pkgname/tests
  # Float representation does not match CPython
  # Also, lots of tests failing when Python >= 3.12
  export MICROPY_MICROPYTHON=../ports/unix/build-standard/micropython
  ./run-tests.py \
    --exclude asyncio_get_event_loop \
    --exclude asyncio_loop_stop \
    --exclude asyncio_new_event_loop \
    --exclude bytes \
    --exclude float2int_doubleprec_intbig \
    --exclude float2int_fp30_intbig \
    --exclude float2int_intbig \
    --exclude float_parse \
    --exclude float_parse_doubleprec \
    --exclude gen_yield_from_throw \
    --exclude generator_throw \
    --exclude re_namedclass \
    --exclude re_sub \
    --exclude slice_op \
    --exclude string1 \
    --exclude string_fstring
}

package() {
  cd $_pkgname
  # Install documentation
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  # Install license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  # Install binaries
  install -Dm 755 mpy-cross/build/mpy-cross -t "$pkgdir"/usr/bin
  cd ports/unix
  make PREFIX="$pkgdir"/usr install
}
