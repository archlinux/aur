# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wslay
pkgver=1.1.1
pkgrel=1
pkgdesc="The WebSocket library in C"
arch=('i686' 'x86_64')
makedepends=('autoconf' 'automake' 'git' 'libtool' 'make' 'pkg-config' 'python-sphinx')
checkdepends=('cunit' 'nettle')
url="https://github.com/tatsuhiro-t/wslay"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/tatsuhiro-t/$pkgname/tar.gz/release-$pkgver"
        'sphinx-4.patch')
sha256sums=('7b9f4b9df09adaa6e07ec309b68ab376c0db2cfd916613023b52a47adfda224a'
            '6c267a29790d6f19c4c86106299ea2a247d52e56f95bd42aceb62dff7ef5a4f5')

prepare() {
  cd "$srcdir/$pkgname-release-$pkgver"
  patch -Np1 <../sphinx-4.patch
}

build() {
  cd "$srcdir/$pkgname-release-$pkgver"

  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/wslay \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/wslay \
    --localstatedir=/var/lib/wslay \
    --with-gnu-ld
  make
}

check() {
  cd "$srcdir/$pkgname-release-$pkgver"

  make check
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"

  msg 'Installing license...'
  install -Dm 644 AUTHORS "$pkgdir/usr/share/licenses/${pkgname%-git}/AUTHORS"
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-git}/COPYING"

  msg 'Installing documentation...'
  for _doc in ChangeLog NEWS README README.rst; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/${pkgname%-git}/$_doc"
  done

  msg 'Installing...'
  make DESTDIR="$pkgdir" install
  for _bin in `find "$pkgdir/usr/bin" -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    mv "$pkgdir/usr/bin/${_bin}" "$pkgdir/usr/bin/wslay_${_bin}"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
