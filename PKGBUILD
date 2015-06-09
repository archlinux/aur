# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wslay-git
pkgver=20141215
pkgrel=1
pkgdesc="The WebSocket library in C"
arch=('i686' 'x86_64')
makedepends=('autoconf' 'automake' 'git' 'libtool' 'make' 'pkg-config' 'python-sphinx')
optdepends=('cunit: build and run tests'
            'nettle: build and run tests')
url="https://github.com/tatsuhiro-t/wslay"
license=('MIT')
source=(git+https://github.com/tatsuhiro-t/wslay)
sha256sums=('SKIP')
provides=('wslay')
conflicts=('wslay')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

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
  cd ${pkgname%-git}

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
