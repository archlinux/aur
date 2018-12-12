# Maintainer:  max.bra <max dot bra dot gtalk at gmail dot com>
# Maintainer:  graysky <graysky AT archlinux DOT us>

pkgname=pi-hole-server
_pkgname=pi-hole
pkgver=4.1
pkgrel=2
_wwwpkgname=AdminLTE
_wwwpkgver=4.1
pkgdesc='The Pi-hole is an advertising-aware DNS/Web server. Arch adaptation for lan wide DNS server.'
arch=('any')
license=('EUPL-1.1')
url="https://github.com/pi-hole/pi-hole"
depends=('pi-hole-ftl' 'bc' 'perl' 'net-tools' 'iproute2' 'logrotate' 'bind-tools')
optdepends=(
'lighttpd: a secure, fast, compliant and very flexible web-server'
'php-cgi: CGI and FCGI SAPI for PHP needed only for lighttpd'
'nginx-mainline: lightweight http server'
'php-fpm: FastCGI process manager for php needed for nginx'
)
conflicts=('pi-hole-standalone')
install=$pkgname.install
backup=('etc/pihole/whitelist.txt' 'etc/pihole/blacklist.txt' 'etc/pihole/regex.list'
'etc/dnsmasq.d/01-pihole.conf' 'etc/pihole/adlists.list' 'etc/dnsmasq.conf')

source=(pihole-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz
	    admin-$_wwwpkgver.tar.gz::https://github.com/$_pkgname/$_wwwpkgname/archive/v$_wwwpkgver.tar.gz
        "https://raw.github.com/max72bra/pi-hole-server-archlinux-customization/master/arch-server-core-$pkgver.patch"
        "https://raw.github.com/max72bra/pi-hole-server-archlinux-customization/master/arch-server-admin-$pkgver.patch"
	    dnsmasq.include
	    lighttpd.pi-hole.conf
	    nginx.pi-hole.conf
	    $_pkgname.tmpfile
	    $_pkgname-gravity.service
	    $_pkgname-gravity.timer
	    $_pkgname-logtruncate.service
	    $_pkgname-logtruncate.timer
	    mimic_setupVars.conf.sh
	    version.patch
	    piholeDebug.sh
)

md5sums=('c128bec162c5cff3136ad680c326579f'
         '5d87f45f3811cafbf9a4c0685a87170a'
         '172047cda180834a3f9f8325359e65e3'
         '1a6aa653fdf7a6406d550aabb023cafe'
         '4d6b3db77bd0b712fc193aa32ba4eea8'
         '971cc2859672341d77f8deba702fb7f7'
         'b63fcf29c29796023a2677bcf2b369a7'
         '9bc23c314397a0f59978cfe246140cda'
         '047f13d4ac97877f724f87b002aaee63'
         'd42a864f88299998f8233c0bc0dd093d'
         '20c5b0c6b4e23e55b25ab6c28dda709d'
         '291d3c95e445fe65caf40c3605efd186'
         'c227ffa88ddebc34cb715b73640cd845'
         'adfcdfb4b90e278b1a850b0d506d2e76'
         'd7b69ae51db0e8ac8e27f20a234eed85')

prepare() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  patch -Np1 -i "$srcdir"/arch-server-core-$pkgver.patch
  patch -p1 -i "$srcdir"/version.patch
  cd "$srcdir"/"$_wwwpkgname"-"$_wwwpkgver"
  patch -Np1 -i "$srcdir"/arch-server-admin-$pkgver.patch
}

package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-$pkgver/pihole "$pkgdir"/usr/bin/pihole

  install -dm755 "$pkgdir"/opt/pihole
  install -Dm755 $_pkgname-$pkgver/gravity.sh "$pkgdir"/opt/pihole/gravity.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/version.sh "$pkgdir"/opt/pihole/version.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/piholeLogFlush.sh "$pkgdir"/opt/pihole/piholeLogFlush.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/chronometer.sh "$pkgdir"/opt/pihole/chronometer.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/list.sh "$pkgdir"/opt/pihole/list.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/webpage.sh "$pkgdir"/opt/pihole/webpage.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/COL_TABLE "$pkgdir"/opt/pihole/COL_TABLE
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/wildcard_regex_converter.sh "$pkgdir"/opt/pihole/wildcard_regex_converter.sh
  install -Dm755 $_pkgname-$pkgver/advanced/Scripts/query.sh "$pkgdir"/opt/pihole/query.sh

  install -Dm755 piholeDebug.sh "$pkgdir"/opt/pihole/piholeDebug.sh
  install -Dm755 mimic_setupVars.conf.sh "$pkgdir"/opt/pihole/mimic_setupVars.conf.sh

  install -dm750 "$pkgdir"/etc/sudoers.d
  install -Dm440 $_pkgname-$pkgver/advanced/Templates/pihole.sudo "$pkgdir"/etc/sudoers.d/pihole
  install -Dm644 $_pkgname-$pkgver/advanced/dnsmasq.conf.original "$pkgdir"/etc/dnsmasq.conf
#  install -Dm644 dnsmasq.main "$pkgdir"/usr/share/pihole/configs/dnsmasq.example.conf
  install -Dm644 dnsmasq.include "$pkgdir"/etc/dnsmasq.d/01-pihole.conf

  install -Dm644 pi-hole.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/pi-hole.conf

  install -Dm644 "$_pkgname-gravity.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-gravity.timer"
  install -Dm644 "$_pkgname-gravity.service" $pkgdir/usr/lib/systemd/system/$_pkgname-gravity.service
  install -Dm644 "$_pkgname-logtruncate.timer" "$pkgdir/usr/lib/systemd/system/$_pkgname-logtruncate.timer"
  install -Dm644 "$_pkgname-logtruncate.service" $pkgdir/usr/lib/systemd/system/$_pkgname-logtruncate.service
  install -dm755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../$_pkgname-gravity.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-gravity.timer"
  ln -s ../$_pkgname-logtruncate.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/$_pkgname-logtruncate.timer"

  install -dm755 "$pkgdir"/etc/pihole
  install -dm755 "$pkgdir"/usr/share/pihole/configs
  install -Dm644 $_pkgname-$pkgver/adlists.list "$pkgdir"/etc/pihole/adlists.list
  install -Dm644 $_pkgname-$pkgver/advanced/Templates/logrotate "$pkgdir"/etc/pihole/logrotate
  install -Dm644 /dev/null "$pkgdir"/etc/pihole/whitelist.txt
  install -Dm644 /dev/null "$pkgdir"/etc/pihole/blacklist.txt
  install -Dm644 /dev/null "$pkgdir"/etc/pihole/regex.list

  install -Dm644 lighttpd.pi-hole.conf "$pkgdir"/usr/share/pihole/configs/lighttpd.example.conf
  install -Dm644 nginx.pi-hole.conf "$pkgdir"/usr/share/pihole/configs/nginx.example.conf

  install -dm755 "$pkgdir"/srv/http/pihole/admin
  install -Dm644 $_pkgname-$pkgver/advanced/index.php "$pkgdir"/srv/http/pihole/pihole/index.php
#  install -Dm644 $_pkgname-$pkgver/advanced/index.js "$pkgdir"/srv/http/pihole/pihole/index.js
  install -Dm644 $_pkgname-$pkgver/advanced/blockingpage.css "$pkgdir"/srv/http/pihole/pihole/blockingpage.css

  cp -dpr --no-preserve=ownership $_wwwpkgname-$_wwwpkgver/* "$pkgdir"/srv/http/pihole/admin/

  install -dm755 "$pkgdir"/usr/share/licenses/pihole
  install -Dm644 ${pkgname%-*}-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/pihole/Pi-hole
  install -Dm644 $_wwwpkgname-$_wwwpkgver/LICENSE "$pkgdir"/usr/share/licenses/pihole/AdminLTE
  install -Dm644 $_wwwpkgname-$_wwwpkgver/style/vendor/SourceSansPro/OFL.txt \
    "$pkgdir"/usr/share/licenses/pihole/SourceSansPro

  rm "$pkgdir"/srv/http/pihole/admin/*.md
  rm "$pkgdir"/srv/http/pihole/admin/LICENSE
  rm "$pkgdir"/srv/http/pihole/admin/style/vendor/LICENSE
  rm "$pkgdir"/srv/http/pihole/admin/scripts/vendor/LICENSE
  rm "$pkgdir"/srv/http/pihole/admin/style/vendor/SourceSansPro/OFL.txt
}
