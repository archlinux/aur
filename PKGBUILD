# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-standalone
_pkgname=pi-hole
pkgver=2.6.2
pkgrel=1
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch alteration for standalone PC.'
arch=('any')
license=('GPL2')
url="https://github.com/jacobsalmela/pi-hole"
depends=('dnsmasq' 'openresolv')
conflicts=('pi-hole-server')
install=$pkgname.install

source=(https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
	configuration
	dnsmasq.complete
	dnsmasq.include
	$_pkgname-gravity.service
	$_pkgname-gravity.timer
	whitelist.txt
	blacklist.txt)

md5sums=('f899e540c76224575d15ed7af928703e'
         '925e5f23e36320ec13f55cff3f1bdcb7'
         'fa485f038d577c354068410ed1159d94'
         '1b2e808b699a6b58647641f12379f65d'
         '09a4bb7aef7bbe1a1f4c6c85c1fd48b4'
         'd42a864f88299998f8233c0bc0dd093d'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e')

prepare() {
  _ssc="/tmp/sedcontrol"

  # change local ip to unusable 0.0.0.0 (ref. http://dlaa.me/blog/post/skyhole)
  sed -n "/^function gravity_reload() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: change local ip to unusable 0.0.0.0 (ref. http://dlaa.me/blog/post/skyhole)" && return 1 ; fi
  sed -i '/^function gravity_reload() {/a sed -i "s/^[0-9\\.]\\+\\s/0.0.0.0 /g" /etc/pihole/gravity.list' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  # modify service management
  sed -i "s|^		\$SUDO service dnsmasq start|		$SUDO systemctl start dnsmasq|w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: modify service management" && return 1 ; fi

  # gravity call paths changing
  sed -i "s|/opt/pihole/|/usr/bin/|w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: gravity call paths changing" && return 1 ; fi

  # adlists.default is already there
  sed -i "s/\$SUDO cp \/etc\/.pihole\/adlists.default \/etc\/pihole\/adlists.default//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: adlists.default is already there" && return 1 ; fi

  # useless by definition
  sed -n "/# Reload hosts file/w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: useless by definition" && return 1 ; fi
  sed -i '/# Reload hosts file/,+8d' "$srcdir"/$_pkgname-$pkgver/gravity.sh
}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/usr/bin/gravity.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/blacklist.sh "$pkgdir"/usr/bin/blacklist.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/whitelist.sh "$pkgdir"/usr/bin/whitelist.sh || return 1

  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  install -Dm644 "$_pkgname-gravity.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-gravity.timer"
  install -Dm644 "$_pkgname-gravity.service" $pkgdir/usr/lib/systemd/system/$_pkgname-gravity.service
  ln -s ../$_pkgname-gravity.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-gravity.timer"

  install -dm777 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/etc/pihole/configs
  install -Dm644 ./$_pkgname-$pkgver/adlists.default "$pkgdir"/etc/pihole/adlists.default || return 1
  install -Dm644 whitelist.txt "$pkgdir"/etc/pihole/whitelist.txt || return 1
  install -Dm644 blacklist.txt "$pkgdir"/etc/pihole/blacklist.txt || return 1
  install -Dm644 dnsmasq.complete "$pkgdir"/etc/pihole/configs/dnsmasq.complete || return 1
  install -Dm644 dnsmasq.include "$pkgdir"/etc/pihole/configs/dnsmasq.include || return 1
  install -Dm644 configuration "$pkgdir"/usr/share/doc/pihole/configuration || return 1
}

