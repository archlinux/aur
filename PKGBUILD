# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-standalone
_pkgname=pi-hole
pkgver=2.9.5
pkgrel=2
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch alteration for standalone PC.'
arch=('any')
license=('GPL2')
url="https://github.com/pi-hole/pi-hole"
depends=('dnsmasq' 'openresolv')
conflicts=('pi-hole-server')
install=$pkgname.install
backup=('etc/pihole/whitelist.txt' 'etc/pihole/blacklist.txt')

source=(https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
	configuration
	dnsmasq.main
	dnsmasq.include
	$_pkgname-gravity.service
	$_pkgname-gravity.timer
	whitelist.txt
	blacklist.txt
	mimic_setupVars.conf.sh)

md5sums=('b383a2741e556a3680b3ae312a18cfba'
         'bc28e67029222243ba2ca9b3a1855469'
         'c39b31cbad16482630196704167afe2a'
         '1b2e808b699a6b58647641f12379f65d'
         '047f13d4ac97877f724f87b002aaee63'
         'd42a864f88299998f8233c0bc0dd093d'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         '10d149fd88ba428584333a151c164915')

prepare() {
  _ssc="/tmp/sedcontrol"

  # setting up and securing pihole wrapper script
  sed -n "/debugFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 1" && return 1 ; fi
  sed -i '/debugFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/flushFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 2" && return 1 ; fi
  sed -i '/flushFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/versionFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 3" && return 1 ; fi
  sed -i '/versionFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/updatePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 4" && return 1 ; fi
  sed -i '/updatePiholeFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/reconfigurePiholeFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 5" && return 1 ; fi
  sed -i '/reconfigurePiholeFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/setupLCDFunction() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 6" && return 1 ; fi
  sed -i '/setupLCDFunction() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/chronometerFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 7" && return 1 ; fi
  sed -i '/chronometerFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstallFunc() {/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 8" && return 1 ; fi
  sed -i '/uninstallFunc() {/,+4d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/:::  \-[d,f,u,s,c,v]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 9" && return 1 ; fi
  sed -i '/:::  \-[d,f,u,s,c,v]/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/\"\-[d,f,u,r,s,c,v]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 10" && return 1 ; fi
  sed -i '/\"\-[d,f,u,r,s,c,v]/d' "$srcdir"/$_pkgname-$pkgver/pihole

  sed -n "/uninstall/w $_ssc" "$srcdir"/$_pkgname-$pkgver/pihole
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing pihole wrapper script 11" && return 1 ; fi
  sed -i '/uninstall/d' "$srcdir"/$_pkgname-$pkgver/pihole

# -----------------

  # adlists.default is already there
  sed -i "s/cp \/etc\/.pihole\/adlists.default \/etc\/pihole\/adlists.default//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: adlists.default is already there" && return 1 ; fi

# -----------------

  # arch useless
  sed -n "/#ensure \/etc\/dnsmasq\.d\//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: arch useless" && return 1 ; fi
  sed -i '/#ensure \/etc\/dnsmasq\.d\//,+5d' "$srcdir"/$_pkgname-$pkgver/gravity.sh
}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/pihole "$pkgdir"/usr/bin/pihole || return 1

  install -dm755 "$pkgdir"/opt/pihole
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/opt/pihole/gravity.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/list.sh "$pkgdir"/opt/pihole/list.sh || return 1

  install -Dm755 mimic_setupVars.conf.sh "$pkgdir"/opt/pihole/mimic_setupVars.conf.sh || return 1
  
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  install -Dm644 "$_pkgname-gravity.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-gravity.timer"
  install -Dm644 "$_pkgname-gravity.service" $pkgdir/usr/lib/systemd/system/$_pkgname-gravity.service
  ln -s ../$_pkgname-gravity.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-gravity.timer"

  install -dm777 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/etc/pihole/configs
  install -Dm644 ./$_pkgname-$pkgver/adlists.default "$pkgdir"/etc/pihole/adlists.default || return 1
  install -Dm644 whitelist.txt "$pkgdir"/etc/pihole/whitelist.txt || return 1
  install -Dm644 blacklist.txt "$pkgdir"/etc/pihole/blacklist.txt || return 1
  install -Dm644 dnsmasq.main "$pkgdir"/etc/pihole/configs/dnsmasq.main || return 1
  install -Dm644 dnsmasq.include "$pkgdir"/etc/pihole/configs/dnsmasq.include || return 1
  install -Dm644 configuration "$pkgdir"/usr/share/doc/pihole/configuration || return 1
}

