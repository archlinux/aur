# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>
# Maintainer:  graysky <graysky AT archlinux DOT us>

pkgname=pi-hole-ftl
_pkgname=FTL
_servicename=pihole-FTL
pkgver=4.2
pkgrel=2
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="The Pi-hole FTL engine"
url="https://github.com/pi-hole/FTL"
license=('EUPL-1.1')
depends=('nettle' 'gmp')
makedepends=('sqlite')
conflicts=('dnsmasq')
provides=('dnsmasq')
install=$pkgname.install
backup=('etc/pihole/pihole-FTL.conf' 'etc/pihole/pihole-FTL.db')
source=("https://github.com/pi-hole/FTL/archive/v$pkgver.tar.gz"
         "https://raw.github.com/max72bra/pi-hole-ftl-archlinux-customization/master/arch-ftl-$pkgver.patch"
         "00-4.2.1-pre_1_of_2.patch::https://github.com/pi-hole/FTL/commit/5f7161f59a5b28f8af177a559a90cc3016b655a4.patch"
         "01-4.2.1-pre_2_of_2.patch::https://github.com/pi-hole/FTL/commit/1404ea167945fcbffa80198505352a799b0d4557.patch"
         "$pkgname.tmpfile"
         "$pkgname.service"
         "$pkgname.db"
         "$pkgname.conf")
md5sums=('b09848cc6c1eeccf4900d64e36616e81'
         '99e71d9e56d4fd5a47e95e3a353e49d7'
         '3664a81ee1374843bcb6c437010921b0'
         '949dd46d73f7e56639c86d4591501f42'
         '5faa64558cc0a5888923fcf77c299fa7'
         'f3e42ec6f04180c6d6972998bf172a41'
         '0495c002b7d5dce303d451e4cd2fede5'
         '40b1c4174198eacd7d12eb9b356aced0')

prepare() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  patch -Np1 -i ../arch-ftl-$pkgver.patch
  patch -Np1 -i ../00-4.2.1-pre_1_of_2.patch
  patch -Np1 -i ../01-4.2.1-pre_2_of_2.patch
}

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"
  install -Dm755 "$_pkgname"-$pkgver/pihole-FTL "${pkgdir}"/usr/bin/pihole-FTL
  
  install -Dm644 "$pkgname.tmpfile" "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf

  install -dm755 "$pkgdir"/etc/pihole
  install -Dm644 "$pkgname.conf" "$pkgdir"/etc/pihole/pihole-FTL.conf
  install -Dm644 "$pkgname.db" "$pkgdir"/etc/pihole/pihole-FTL.db

  install -Dm644 "$pkgname.service" "$pkgdir"/usr/lib/systemd/system/$_servicename.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$_servicename.service "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_servicename.service"
}
