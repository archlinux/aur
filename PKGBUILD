# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname=micropython
pkgname=$_pkgname-git
pkgver=1.23.0.r138.gdef6ad4742
pkgrel=1
epoch=1
pkgdesc='A Python implementation for microcontrollers and constrained systems (UNIX git version)'
arch=(x86_64)
url='https://micropython.org/'
license=(MIT)
depends=(glibc libffi)
makedepends=(git python)
provides=($_pkgname)
conflicts=($_pkgname mpy-cross)
optdepends=('mpremote: to install micropython-lib and third-party modules')
source=("$_pkgname::git+https://github.com/micropython/$_pkgname.git"
        'berkeley-db-1.xx::git+https://github.com/pfalcon/berkeley-db-1.xx.git'
        'libffi::git+https://github.com/atgreen/libffi.git'
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
    git config submodule.$submodule.url "$srcdir"/$submodule
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
  export MICROPY_MICROPYTHON=../ports/unix/build-standard/micropython
  ./run-tests.py \
    --exclude float_parse \
    --exclude float_parse_doubleprec
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
