# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-standalone
_pkgname=pi-hole
pkgver=2.2
pkgrel=1
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch alteration for standalone PC.'
arch=('any')
license=('GPL2')
url="https://github.com/jacobsalmela/pi-hole"
depends=('cron' 'dnsmasq' 'openresolv')
conflicts=('pi-hole-server')
install=$pkgname.install

source=(https://github.com/jacobsalmela/$_pkgname/archive/v$pkgver.tar.gz
	configuration
	dnsmasq.complete
	dnsmasq.include
	$_pkgname.cron
	whitelist.txt
	blacklist.txt)

md5sums=('8387d55bc37b661827ad614701157b19'
         '8820584b1a9e0b49edcf9c06e1195553'
         'fa485f038d577c354068410ed1159d94'
         '1b2e808b699a6b58647641f12379f65d'
         'a2d0530954e8eb19592f686e29c24c45'
         '534de24fb56acfd3b451cf4b1b382218'
         '534de24fb56acfd3b451cf4b1b382218')

prepare() {
  # change local ip to unusable 0.0.0.0 (ref. http://dlaa.me/blog/post/skyhole)
  sed -i '/^function gravity_reload() {/a sed -i "s/^[0-9\\.]\\+\\s/0.0.0.0 /g" /etc/pihole/gravity.list' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  # modify service management
  sed -i 's|^		sudo service dnsmasq start|		systemctl start dnsmasq|' "$srcdir"/$_pkgname-$pkgver/gravity.sh
}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/usr/bin/gravity.sh || return 1
  install -Dm755 $_pkgname.cron "$pkgdir"/etc/cron.weekly/$_pkgname || return 1
  install -dm777 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/etc/pihole/configs
  install -Dm644 whitelist.txt "$pkgdir"/etc/pihole/whitelist.txt || return 1
  install -Dm644 blacklist.txt "$pkgdir"/etc/pihole/blacklist.txt || return 1
  install -Dm644 dnsmasq.complete "$pkgdir"/etc/pihole/configs/dnsmasq.complete || return 1
  install -Dm644 dnsmasq.include "$pkgdir"/etc/pihole/configs/dnsmasq.include || return 1
  install -Dm644 configuration "$pkgdir"/usr/share/doc/pihole/configuration || return 1
}

