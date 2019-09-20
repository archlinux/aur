# Maintainer: Yousef Sultan <yousef.su.2000@gmail.com>

pkgname=bbswitch-monitor
pkgver=0.1.2
pkgrel=3
pkgdesc="System tray icon to monitor external GPU on/off status with Bumblebee"
arch=('x86_64')
url='https://github.com/MicroDroid/bbswitch-monitor'
provides=('bbswitch-monitor')
license=('MIT')
depends=('bbswitch')
makedepends=('make' 'qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MicroDroid/bbswitch-monitor/archive/v${pkgver}.tar.gz")
sha256sums=('964ed445ffbb2e91e36e5ecbd1a88bf5c9647fdb630cf5cf601bb6eed35bad90')

build() {
  mkdir -p "$srcdir/$pkgname-$pkgver/build/"
  cd "$srcdir/$pkgname-$pkgver/build/"
  qmake ../bbswitch-monitor.pro PREFIX=/usr/local
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr/local
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  INSTALL_ROOT="${pkgdir}" make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr/local install

  mkdir -p "${pkgdir}/usr/local/bin"
  mkdir -p "${pkgdir}/etc/systemd/user"

  mv "${pkgdir}/opt/bbswitch-monitor/bin/bbswitch-monitor" "${pkgdir}/usr/local/bin"
  cp "${srcdir}/../bbswitch-monitor.service" "${pkgdir}/etc/systemd/user"

  rm -r "${pkgdir}/opt"

  echo "--- NOTE: Don't forget to run: systemctl --user enable bbswitch-monitor"
}
