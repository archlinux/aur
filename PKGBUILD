# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgbase=micropython
pkgname=(micropython micropython-lib)
pkgver=1.8.7
_libver=1.8.6
# stupid submodules
_axver=1.8.2
_ffiver=3.2.1
pkgrel=1
pkgdesc="Python3 for microcontrollers, with stdlib.  (unix version)"
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('readline' 'libffi' 'mbedtls')
makedepends=('python' 'python-setuptools' 'git')
options=('!emptydirs')
source=("mpy-$pkgver.tgz::https://github.com/micropython/micropython/archive/v$pkgver.tar.gz"
        "mlib-$_libver.tgz::https://github.com/micropython/micropython-lib/archive/v$_libver.tar.gz"
        "axtls-$_axver.tgz::https://github.com/pfalcon/axtls/archive/v$_axver.tar.gz"  # completely broken
        "ffi-$_ffiver.tgz::https://github.com/libffi/libffi/archive/v$_ffiver.tar.gz"
        "bdb.tgz::https://github.com/pfalcon/berkeley-db-1.xx/archive/embedded.tar.gz")  # submodule with no releases!
# What about the lwip submodule?  The repo is GONE.  You didn't need an IP stack anyway.
# Maybe http://download.savannah.gnu.org/releases/lwip/lwip-2.0.0.zip is it?
md5sums=('80fd6b88c05ed20886acfd2fb1ea2e11'
         'e0b313e7d6378f52607844fd30d79630'
         'e11da4ef04499030d1eff69b474f34f0'
         '9066486bcab807f7ddaaf2596348c1db'
         '14ba0a830ddb10a309f0f1965f05cf84')


# todo:
# fix 'imported as namespace package' warnings from stdlib

prepare() {
  cd "$srcdir/micropython-$pkgver/lib"
  # fix submodules
  rmdir axtls
  rmdir libffi
  rmdir berkeley-db-1.xx
  ln -s "$srcdir/axtls-$_axver" axtls
  ln -s "$srcdir/libffi-$_ffiver" libffi
  ln -s "$srcdir/berkeley-db-1.xx-embedded" berkeley-db-1.xx

  # fix makefile
  cd "$srcdir/micropython-$pkgver/unix"
  sed -i 's|/local||' Makefile
  sed -i 's|git clean -d -x -f||' Makefile

  # use mbedtls
  sed -i 's/MICROPY_PY_USSL = 1/MICROPY_PY_USSL = 0/' mpconfigport.mk
  sed -i 's/MICROPY_SSL_AXTLS = 1/MICROPY_SSL_AXTLS = 0/' mpconfigport.mk
  sed -i 's/MICROPY_SSL_MBEDTLS = 0/MICROPY_SSL_MBEDTLS = 1/' mpconfigport.mk
}

build() {
  cd "$srcdir/micropython-$pkgver/unix"
  make libffi
  #make V=1 deplibs
  make
  cd "$srcdir/micropython-lib-$_libver"
  make
}

check() {
  cd "$srcdir/micropython-$pkgver/unix"
  #make test
}

package_micropython() {
  cd "$srcdir/micropython-$pkgver/unix"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/micropython-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_micropython-lib() {
  cd "$srcdir/micropython-lib-$_libver"
  for _d in $(find -mindepth 1 -maxdepth 1 -type d); do
    # todo, figure out what provides this
    if grep -qr 'import metadata' ./$_d/*; then
      error "Skipping $_d (bad import)"
      continue
    fi
    if [[ ! -f $_d/setup.py ]]; then
      error "Skipping $_d (no setup)"
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

