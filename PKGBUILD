# Contributor: Mettacrawer <metta.crawler@gmail.com>
# Contributor: luizribeiro <luizribeiro@gmail.com>
# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>
# Maintainer:  graysky <graysky AT archlinux DOT us>

pkgname=pi-hole-ftl
_pkgname=FTL
_servicename=pihole-FTL
pkgver=5.2
pkgrel=1
_now=`date +%N`
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="The Pi-hole FTL engine"
url="https://github.com/pi-hole/FTL"
license=('EUPL-1.1')
depends=('nettle' 'gmp' 'libidn')
makedepends=('cmake' 'sqlite')
conflicts=('dnsmasq')
provides=('dnsmasq')
install=$pkgname.install
backup=('etc/pihole/pihole-FTL.conf' 'etc/pihole/pihole-FTL.db')
source=($pkgname-v$pkgver.tar.gz::"https://github.com/pi-hole/FTL/archive/v$pkgver.tar.gz"
        arch-ftl-$pkgver-$_now.patch::"https://raw.githubusercontent.com/max72bra/pi-hole-ftl-archlinux-customization/master/arch-ftl-$pkgver.patch"
        "$pkgname.tmpfile"
        "$pkgname.sysuser"
        "$pkgname.service"
        "$pkgname.db"
        "$pkgname.conf")
md5sums=('f97134439dd96f59180d49e6a9d4f245'
         '89979ad786434e577536008f82e7e161'
         'ca844c23699ba64777571253bc7ccb21'
         '455c38b73491bf641e422be3652698b7'
         '5e135fd2729441f908d848a45b1ff289'
         '0495c002b7d5dce303d451e4cd2fede5'
         'a9c8de83f02d36bfe96db57975984bbb')

prepare() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  patch -Np1 -i "$srcdir"/arch-ftl-$pkgver-$_now.patch
}

build() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm775 "$_pkgname"-$pkgver/pihole-FTL "${pkgdir}"/usr/bin/pihole-FTL
  
  install -Dm644 "$pkgname.tmpfile" "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 "$pkgname.sysuser" "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf

  install -dm755 "$pkgdir"/etc/pihole
  install -Dm644 "$pkgname.conf" "$pkgdir"/etc/pihole/pihole-FTL.conf
  install -Dm644 "$pkgname.db" "$pkgdir"/etc/pihole/pihole-FTL.db

  install -Dm644 "$pkgname.service" "$pkgdir"/usr/lib/systemd/system/$_servicename.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$_servicename.service "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_servicename.service"
  
  # ver. 5.0 dnamasq dropin support
  ln -s ./pihole-FTL "$pkgdir/usr/bin/dnsmasq"
}
