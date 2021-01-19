# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=pi-hole-standalone
_pkgname=pi-hole
pkgver=5.2.4
pkgrel=1
_now=`date +%N`
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch alteration for standalone PC.'
arch=('any')
license=('EUPL-1.1')
url="https://github.com/pi-hole/pi-hole"
depends=('pi-hole-ftl' 'net-tools' 'iproute2' 'bind-tools' 'sudo' 'lsof')
conflicts=('pi-hole-server')
install=$pkgname.install
backup=('etc/dnsmasq.d/01-pihole.conf')

source=($pkgname-core-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
	arch-server-core-$pkgver-$_now.patch::"https://raw.githubusercontent.com/max72bra/pi-hole-standalone-archlinux-customization/master/arch-server-core-$pkgver.patch"
	dnsmasq.include
	$_pkgname-gravity.service
	$_pkgname-gravity.timer
	mimic_setupVars.conf.sh
	mimic_basic-install.sh
	piholeDebug.sh)

sha256sums=('550de24beae4d701c0486208083e06efa5476fb87a729fe39ddf7fc3cac83a75'
            '92aad8cd123d8509548843641e0c8c0b48bd0e7cbfd56bb9486be61239c8cc1c'
            '2d0caa2d0c6a2d7b74da8456d6df9b15a104ab8c68a24403de2906d329ef2cd5'
            '9b72d7769036f8f4bb7121968d2ae4bdba427e4b16787ce340205a5f62b45c7c'
            '5228b4f923eab7784952a0fd6da895e7bff2f80a7f91c4a7c6350491dfdbb2e8'
            '8119a46428bdbe00a312b14f3f0c364248b120f2569c9f2b6af2ef1a64fdfe94'
            'fa8d91d07b75f21076e5334c46d323cbc3dcf9a33fe9b8b4e032dbc5c979a6d2'
            '73a8362f7a3eac91c77efbbcb4910ff079203bb5f829e32ecf3391d017117bb8')

prepare() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  patch -Np1 -i "$srcdir"/arch-server-core-$pkgver-$_now.patch
}

package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-$pkgver/pihole "$pkgdir"/usr/bin/pihole

  install -dm755 "$pkgdir"/opt/pihole
  install -Dm755 $_pkgname-$pkgver/gravity.sh "$pkgdir"/opt/pihole/gravity.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/list.sh "$pkgdir"/opt/pihole/list.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/webpage.sh "$pkgdir"/opt/pihole/webpage.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/wildcard_regex_converter.sh "$pkgdir"/opt/pihole/wildcard_regex_converter.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/query.sh "$pkgdir"/opt/pihole/query.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/pihole-reenable.sh "$pkgdir"/opt/pihole/pihole-reenable.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/piholeARPTable.sh "$pkgdir"/opt/pihole/piholeARPTable.sh

  install -Dm644 $_pkgname-$pkgver/advanced/Scripts/COL_TABLE "$pkgdir"/opt/pihole/COL_TABLE

  install -Dm644 $_pkgname-$pkgver/advanced/Templates/gravity.db.sql "$pkgdir"/opt/pihole/gravity.db.sql
  install -Dm644 $_pkgname-$pkgver/advanced/Templates/gravity_copy.sql "$pkgdir"/opt/pihole/gravity_copy.sql

  install -Dm755 piholeDebug.sh "$pkgdir"/opt/pihole/piholeDebug.sh
  install -Dm755 mimic_setupVars.conf.sh "$pkgdir"/opt/pihole/mimic_setupVars.conf.sh
  install -Dm755 mimic_basic-install.sh "$pkgdir"/opt/pihole/basic-install.sh

  cp -dpr --no-preserve=ownership $_pkgname-$pkgver/advanced/Scripts/database_migration "$pkgdir"/opt/pihole/

  install -Dm644 $_pkgname-$pkgver/advanced/dnsmasq.conf.original "$pkgdir"/etc/dnsmasq.conf
  install -Dm644 dnsmasq.include "$pkgdir"/etc/dnsmasq.d/01-pihole.conf

  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  install -Dm644 "$_pkgname-gravity.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-gravity.timer"
  install -Dm644 "$_pkgname-gravity.service" $pkgdir/usr/lib/systemd/system/$_pkgname-gravity.service
  ln -s ../$_pkgname-gravity.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-gravity.timer"

  install -dm775 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/usr/share/pihole/configs
  install -Dm644 $_pkgname-$pkgver/adlists.list "$pkgdir"/etc/pihole/adlists.list
  
  install -dm755 "$pkgdir"/usr/share/licenses/pihole
  install -Dm644 ${pkgname%-*}-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/pihole/Pi-hole
}

