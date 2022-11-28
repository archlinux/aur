# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname='micropython'
pkgname=$_pkgname-git
pkgver=1.19.1.r721.gd5181034f2
pkgrel=1
epoch=1
pkgdesc='A Python 3 implementation for microcontrollers and constrained environments (Unix version)'
arch=(x86_64)
url='http://micropython.org/'
license=(MIT)
depends=(libffi)
makedepends=(git python)
provides=($_pkgname)
conflicts=($_pkgname mpy-cross)
optdepends=('micropython-lib: for MicroPython standard library')
source=("$_pkgname::git+https://github.com/micropython/$_pkgname.git"
        'axtls::git+https://github.com/pfalcon/axtls.git'
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
            'SKIP'
            'SKIP')


pkgver() {
  cd $_pkgname

  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

prepare() {
  cd $_pkgname

  for submodule in axtls berkeley-db-1.xx libffi mbedtls micropython-lib; do
    git submodule init lib/$submodule
    git config submodule.$submodule.url "$srcdir"/$submodule
    git -c protocol.file.allow=always submodule update lib/$submodule
  done
}

build() {
  cd $_pkgname
  ( cd mpy-cross; make; )
  ( cd ports/unix; make)
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
  ( cd ports/unix; make PREFIX="$pkgdir"/usr install; )
  install mpy-cross/build/mpy-cross "$pkgdir"/usr/bin
  # Install documentation
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  # Install license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
