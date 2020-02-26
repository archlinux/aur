# Contributor: Mettacrawer <metta.crawler@gmail.com>
# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>
# Maintainer:  graysky <graysky AT archlinux DOT us>

pkgname=pi-hole-ftl
_pkgname=FTL
_servicename=pihole-FTL
pkgver=4.3.1
pkgrel=7
_now=`date +%N`
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
source=($pkgname-v$pkgver::"https://github.com/pi-hole/FTL/archive/v$pkgver.tar.gz"
        arch-ftl-$pkgver-$_now.patch::"https://raw.githubusercontent.com/max72bra/pi-hole-ftl-archlinux-customization/master/arch-ftl-$pkgver.patch"
        "nettle35.patch"
        "glib.patch"
        "$pkgname.tmpfile"
        "$pkgname.sysuser"
        "$pkgname.service"
        "$pkgname.db"
        "$pkgname.conf")
md5sums=('1c0df5fa42e7f7b89c7e704fdc1b5154'
         '882b825fe87e614d2c9be7ab63d24ab1'
         'f6f3d969e1517ff46f9e0ef2e2af4ab9'
         'b0d6917f83dea640bfabeeedb4e10fe1'
         'ca844c23699ba64777571253bc7ccb21'
         '68e78907dc2a0c89421d02377e76d353'
         '20e51cfc70846858d2729c4d5e95d6d5'
         '0495c002b7d5dce303d451e4cd2fede5'
         'a9c8de83f02d36bfe96db57975984bbb')

prepare() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"/dnsmasq
  patch -Np2 -i "$srcdir"/glib.patch
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  patch -Np1 -i "$srcdir"/nettle35.patch
  patch -Np1 -i "$srcdir"/arch-ftl-$pkgver-$_now.patch
}

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"
  install -Dm755 "$_pkgname"-$pkgver/pihole-FTL "${pkgdir}"/usr/bin/pihole-FTL
  
  install -Dm644 "$pkgname.tmpfile" "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 "$pkgname.sysuser" "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf

  install -dm755 "$pkgdir"/etc/pihole
  install -Dm644 "$pkgname.conf" "$pkgdir"/etc/pihole/pihole-FTL.conf
  install -Dm644 "$pkgname.db" "$pkgdir"/etc/pihole/pihole-FTL.db

  install -Dm644 "$pkgname.service" "$pkgdir"/usr/lib/systemd/system/$_servicename.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$_servicename.service "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_servicename.service"
}
