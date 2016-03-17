# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgbase=micropython
pkgname=(micropython micropython-lib)
pkgver=1.6
_libver=1.0
pkgrel=1
pkgdesc="Python3 for microcontrollers, with stdlib.  (unix version)"
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('readline' 'libffi')
makedepends=('python' 'python-setuptools')
options=('!emptydirs')
source=("https://github.com/micropython/micropython/archive/v$pkgver.tar.gz"
        "https://github.com/micropython/micropython-lib/archive/v$_libver.tar.gz")
md5sums=('e5c53c2c19bb454d0854b2ed8896e43c'
         'd4092764630314609ef2a4d2d9d26d14')

# todo:
# fix 'imported as namespace package' warnings from stdlib

build() {
  cd "$srcdir/micropython-$pkgver/unix"
  sed -i 's|/local||' Makefile
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

