# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ddcutil-service
pkgver=1.0.0
pkgrel=2
pkgdesc="A Dbus ddcutil server for control of DDC Monitors/VDUs"
arch=('x86_64')
url="https://github.com/digitaltrails/ddcutil-service"
license=('GPL-2.0-or-later')
depends=('ddcutil')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'fix-Werror=format-security-errors.patch')
sha256sums=('f108d1a3a378fd18e9b37a52f6d9b1914650d3cb6bca6df8bea88568da0054dc'
            'da879e9a458668bb81175d38473aba31272e71f6dbed76d1807c6e9c4f42c22b')

prepare() {
  cd "$pkgname-$pkgver"
  make clean

  # Use system CFLAGS
  sed -i 's/CFLAGS =/CFLAGS+ =/g' Makefile
  patch -Np1 -i ../fix-Werror=format-security-errors.patch
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
