# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgbase=micropython
pkgname=(micropython micropython-lib)
pkgver=1.16
_libver=1.9.3
pkgrel=1
pkgdesc="Python3 for microcontrollers, with stdlib.  (unix version)"
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('readline' 'libffi' 'mbedtls')
makedepends=('python' 'python-setuptools' 'git')
options=('!emptydirs')
# They finally have a real release, without all the submodule garbage.
source=("https://micropython.org/resources/source/micropython-$pkgver.tar.xz"
        "mlib-$_libver.tgz::https://github.com/micropython/micropython-lib/archive/v$_libver.tar.gz")
md5sums=('4d9846fd8e22226994f2470a24dd9667'
         '1752ce13e851a671a07ce3f7a807b21c')

# todo:
# fix 'imported as namespace package' warnings from stdlib

prepare() {
  # fix makefile
  cd "$srcdir/micropython-$pkgver/ports/unix"
  sed -i 's|/local||' Makefile
  sed -i 's|git clean -d -x -f||' Makefile

  # use mbedtls
  sed -i 's/MICROPY_PY_USSL = 1/MICROPY_PY_USSL = 0/' mpconfigport.mk
  sed -i 's/MICROPY_SSL_AXTLS = 1/MICROPY_SSL_AXTLS = 0/' mpconfigport.mk
  sed -i 's/MICROPY_SSL_MBEDTLS = 0/MICROPY_SSL_MBEDTLS = 1/' mpconfigport.mk
}

build() {
  cd "$srcdir/micropython-$pkgver/mpy-cross"
  make
  cd "$srcdir/micropython-$pkgver/ports/unix"
  #make libffi
  #make V=1 deplibs
  make
  cd "$srcdir/micropython-lib-$_libver"
  make
}

check() {
  cd "$srcdir/micropython-$pkgver/ports/unix"
  # some tests appear non-deterministic
  #make test
}

package_micropython() {
  cd "$srcdir/micropython-$pkgver/ports/unix"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/micropython-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_micropython-lib() {
  cd "$srcdir/micropython-lib-$_libver"
  for _d in $(find -mindepth 1 -maxdepth 1 -type d); do
    # todo, figure out what provides this
    # maybe importlib.metadata in python 3.8?
    if grep -qr 'import metadata' ./$_d/*; then
      error "Skipping $_d (bad import)"
      continue
    fi
    if [[ ! -f $_d/setup.py ]]; then
      error "Skipping $_d (no setup)"
      continue
    fi
    # todo: fixing this probably involves overriding PYTHONPATH
    if [[ "$_d" == "./types" ]]; then
      error "Skipping $_d (unresolved name collision)"
      continue
    fi
    msg "Installing $_d"
    cd $_d
    python3 setup.py install --prefix=/usr --root="$pkgdir" --install-lib='/usr/lib/micropython'
    cd ..
  done

  # micropython doesn't support pyc
  find "$pkgdir" -name '*.pyc' -delete

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

