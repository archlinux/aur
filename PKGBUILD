# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=pi-hole-standalone
_pkgname=pi-hole
pkgver=2.12
pkgrel=1
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch alteration for standalone PC.'
arch=('any')
license=('GPL2')
url="https://github.com/pi-hole/pi-hole"
depends=('dnsmasq' 'openresolv' 'net-tools')
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

md5sums=('451877c24c517e056cf4289f72dd5c0b'
         '630a24a3ca258005d11c4a59659f76ed'
         'b955136ef15be29a468e8d9f85f24b8c'
         '796a8c6321e671af80fe884948e466f1'
         '047f13d4ac97877f724f87b002aaee63'
         'd42a864f88299998f8233c0bc0dd093d'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'e3bb1980b565e4d504e0235353f2b2dc')

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

  # setting up and securing webpage.sh script
  sed -n "/SetWebPassword(){/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 1" && return 1 ; fi
  sed -i '/SetWebPassword(){/,+27d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

  sed -n "/SetTemperatureUnit(){/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 2" && return 1 ; fi
  sed -i '/SetTemperatureUnit(){/,+4d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

  sed -n "/SetExcludeDomains(){/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 3" && return 1 ; fi
  sed -i '/SetExcludeDomains(){/,+4d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

  sed -n "/SetExcludeClients(){/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 4" && return 1 ; fi
  sed -i '/SetExcludeClients(){/,+4d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

  sed -n "/EnableDHCP(){/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 5" && return 1 ; fi
  sed -i '/EnableDHCP(){/,+17d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

  sed -n "/SetWebUILayout(){/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 6" && return 1 ; fi
  sed -i '/SetWebUILayout(){/,+4d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

  sed -n "/SetPrivacyMode(){/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 7" && return 1 ; fi
  sed -i '/SetPrivacyMode(){/,+8d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

  sed -n "/\"\-[p,c,f,k]/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 8" && return 1 ; fi
  sed -i '/\"\-[p,c,f,k]/d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

  sed -n "/\"setexcludedomains/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 9" && return 1 ; fi
  sed -i '/\"setexcludedomains/d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  sed -n "/\"setexcludeclients/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 10" && return 1 ; fi
  sed -i '/\"setexcludeclients/d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  sed -n "/\"enabledhcp/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 11" && return 1 ; fi
  sed -i '/\"enabledhcp/d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  sed -n "/\"disabledhcp/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 12" && return 1 ; fi
  sed -i '/\"disabledhcp/d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  sed -n "/\"layout/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 13" && return 1 ; fi
  sed -i '/\"layout/d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  sed -n "/\"privacymode/w $_ssc" "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: setting up and securing webpage.sh script 14" && return 1 ; fi
  sed -i '/\"privacymode/d' "$srcdir"/$_pkgname-$pkgver/advanced/Scripts/webpage.sh

# -----------------

  # arch useless
  sed -n "/#ensure \/etc\/dnsmasq\.d\//w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: arch useless" && return 1 ; fi
  sed -i '/#ensure \/etc\/dnsmasq\.d\//,+5d' "$srcdir"/$_pkgname-$pkgver/gravity.sh

  sed -n "/#Overwrite /w $_ssc" "$srcdir"/$_pkgname-$pkgver/gravity.sh
  if [ -s $_ssc ] ; then rm $_ssc ; else echo "   ==> Sed error: arch useless 2" && return 1 ; fi
  sed -i '/#Overwrite /,+1d' "$srcdir"/$_pkgname-$pkgver/gravity.sh
}

package() {
  cd "$srcdir"
  install -Dm755 ./$_pkgname-$pkgver/pihole "$pkgdir"/usr/bin/pihole || return 1

  install -dm755 "$pkgdir"/opt/pihole
  install -Dm755 ./$_pkgname-$pkgver/gravity.sh "$pkgdir"/opt/pihole/gravity.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/list.sh "$pkgdir"/opt/pihole/list.sh || return 1
  install -Dm755 ./$_pkgname-$pkgver/advanced/Scripts/webpage.sh "$pkgdir"/opt/pihole/webpage.sh || return 1

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
  install -Dm644 dnsmasq.include "$pkgdir"/etc/dnsmasq.d/01-pihole.conf || return 1
  install -Dm644 configuration "$pkgdir"/usr/share/doc/pihole/configuration || return 1
}

