# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman
pkgver=1
pkgrel=2
pkgdesc="Enlightenment ConnMan user interface"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python2-efl' 'connman')
source=("http://packages.profusion.mobi/$pkgname/$pkgname-$pkgver.tar.gz"
        '1.8.patch')
sha256sums=('3e2724423d6cfe24dca6bf34bbc340fb71ecf2e569346c92978593320128f02d'
            '2237a401f07d8a57600251959becd60c7eac6e1010862ac9a70737ed6fa06896')

prepare() {
# Run with python2
  sed -i 's:/usr/bin/python$:&2:' "$srcdir/$pkgname-$pkgver/econnman-bin.in"

# patch out pkg-config checks for bindings, 1.8 bindings don't provide pc files
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < ../1.8.patch
  autoreconf -fiv
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    PYTHON=/usr/bin/python2

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
