# Maintainer: Yousef Sultan <yousef.su.2000@gmail.com>

pkgname=bbswitch-monitor
pkgver=0.1.2
pkgrel=1
pkgdesc="System tray icon to monitor external GPU on/off status with Bumblebee"
arch=('x86_64')
url='https://github.com/MicroDroid/bbswitch-monitor'
provides=('bbswitch-monitor')
license=('MIT')
depends=('bbswitch')
makedepends=('make' 'qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MicroDroid/bbswitch-monitor/archive/v${pkgver}.tar.gz")
sha512sums=('ebee8b42526f038581f25be0d71d94b30c6744b147a93858e3a1f08bd8d25ebc19e9d5a32b31eb19806616ef8a9c513d7d461fa0727548963db4333d8c5be567')

build() {
  mkdir -p "$srcdir/$pkgname-$pkgver/build/"
  cd "$srcdir/$pkgname-$pkgver/build/"
  qmake ../bbswitch-monitor.pro PREFIX=/usr/local
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr/local
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  INSTALL_ROOT="$pkgdir" make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr/local install

  mkdir -p "$pkgdir/usr/local/bin"
  mkdir -p "$pkgdir/etc/systemd/user"

  echo "${pkgdir}"

  mv "$pkgdir/opt/bbswitch-monitor/bin/bbswitch-monitor" "$pkgdir/usr/local/bin"
  cp "$srcdir/$pkgname-$pkgver/bbswitch-monitor.service" "$pkgdir/etc/systemd/user"

  rm -r "$pkgdir/opt"

  printf "\033[1;33m--- NOTE: Don't forget to run: systemctl --user enable bbswitch-monitor\n"
}
