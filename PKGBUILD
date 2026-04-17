# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor: Jed Liu <jed-archlinux@uma.litech.org>

pkgname=tmpreaper
pkgver=1.6.18
pkgrel=1
pkgdesc="Cleans up files in directories based on their age"
arch=('x86_64')
url="http://packages.debian.org/sid/tmpreaper"
license=('GPL-2.0-or-later')
source=(
  https://ftp.debian.org/debian/pool/main/t/tmpreaper/${pkgname}_${pkgver}.tar.xz
  tmpreaper.install
  tmpreaper.service
  tmpreaper.timer
)
install="$pkgname.install"
backup=(etc/tmpreaper.conf)
depends=(glibc util-linux-libs bash)
sha512sums=('643f9c61c8b3ebf86cc3143d9c1f2c1ffd9c6d4e13402b08593b6d1be8ced0db0e527a81dc60b04a8eee1a7ac337ca93a0a52dc5f00795a6ea5db48176efb3f6'
            'e3786852b0543dddcf070d0e275f9bc341e0f343aef162726847fa0a69a58826f7d279c1a01e92555b71a9f450f2064034a53325fc56748267215b8bf9a42401'
            'd2074b54025dd710d431abd2345fd63264f90e5d4e9e8e80c391c4d0978ffa0b9f99615f192a7100fb4b26cbc2aee8c00fd29da18d3ebe7d969dbb2f1894c0a2'
            '8cf3e6548936b864ede952d4b43ec4bdae67a3044449d2646d44d6e104c2c5f9be3dba7fe3bca573d44247fa1eb4e0addbba1ab2f155c01090e99f3a841c6f1a')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  install -Dm644 "$pkgname.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "$pkgname.timer" -t "${pkgdir}/usr/lib/systemd/system/"

  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 "debian/$pkgname.conf" -t "$pkgdir/etc/"
  install -Dm755 debian/cron.daily "$pkgdir/usr/bin/$pkgname.daily"
  install -Dm644 "debian/$pkgname.conf.5" -t "$pkgdir/usr/share/man/man5/"
  gzip debian/README.security
  install -Dm644 debian/README.security.gz -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
