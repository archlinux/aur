# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wslay
pkgver=1.0.0
pkgrel=1
pkgdesc="The WebSocket library in C"
arch=('i686' 'x86_64')
makedepends=('autoconf' 'automake' 'git' 'libtool' 'make' 'pkg-config' 'python-sphinx')
optdepends=('cunit: build and run tests'
            'nettle: build and run tests')
url="https://github.com/tatsuhiro-t/wslay"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/tatsuhiro-t/$pkgname/tar.gz/release-$pkgver)
sha256sums=('874c4a6aa15b596846ff3a3ef848b8a6e6f4ca579a1657df9b318a06ac6c79a6')

build() {
  cd "$srcdir/$pkgname-release-$pkgver"

  msg 'Building...'
  autoreconf -i
  automake
  autoconf
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
