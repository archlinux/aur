# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ddcutil-service
pkgver=1.0.9
pkgrel=1
pkgdesc="A Dbus ddcutil server for control of DDC Monitors/VDUs"
arch=('x86_64')
url="https://github.com/digitaltrails/ddcutil-service"
license=('GPL-2.0-or-later')
depends=('ddcutil')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0e898d07fb5587bb77870fc95f44fcf7ef0d1443e7bace05dc6d662d96be2a2')

prepare() {
  cd "$pkgname-$pkgver"
  make clean

  # comment local build option
  sed -i 's/CFLAGS_DDCUTIL = -isystem $(HOME)\/Downloads\/ddcutil-2.1.5-dev-clion/#CFLAGS_DDCUTIL = -isystem $(HOME)\/Downloads\/ddcutil-2.1.5-dev-clion/g' Makefile
}

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 com.ddcutil.DdcutilService.service -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 "i2c-dev/$pkgname.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "$pkgname.7" -t "$pkgdir/usr/share/man/man7/"
  install -Dm644 docs/html/*.html -t "$pkgdir/usr/share/doc/$pkgname/"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname"
}
