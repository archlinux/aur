# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-gtk2-bin
epoch=1
_buildid=20231105022810
_date=2023.11.05
pkgver=52.9.2023.11.05
pkgrel=1
pkgdesc="A XUL-based web-browser demonstrating the Unified XUL Platform (UXP)."
url="https://www.basilisk-browser.org"
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
source=(https://archive.basilisk-browser.org/${_date}/linux/x86_64/gtk2/basilisk-${_buildid}.linux-x86_64-gtk2.{tar.xz,json}
        'basilisk-gtk2.desktop')
sha256sums=('b8d4085793eb329fb4d3c47640e336b6a210a8adead722a3d39f1da8c869ebb6'
            '13716e93fa2002c98de6da8b6b0543cf27e699bf684ac22695e381958e9ba43c'
            '7bc2df127dce692d236cf822556d1ec325c7df54ea910fbbdf1a04a85008d14d')

pkgver() {
	grep 'moz_app_version' "${srcdir}"/basilisk-${_buildid}.linux-x86_64-gtk2.json | sed -e 's/.*:[\ \t]*"//;s/"[,]*[\ \t]*$//'
#	cd "$srcdir"/basilisk
#	./basilisk --version | grep -o -E '[0-9\.]+$'
}

package() {
	mkdir -p "$pkgdir"/opt
	cp -ar --no-preserve=ownership "$srcdir"/basilisk "$pkgdir"/opt/basilisk-gtk2
	mkdir -p "${pkgdir}"/usr/bin
	cat > "${pkgdir}"/usr/bin/basilisk-gtk2 <<- __EOF__
		#!/bin/bash
		/opt/basilisk-gtk2/basilisk "\$@"
	__EOF__
	chmod 755 "${pkgdir}"/usr/bin/basilisk-gtk2
	install -Dm644 "${srcdir}"/basilisk-gtk2.desktop "${pkgdir}"/usr/share/applications/basilisk-gtk2.desktop
	install -Dm644 "${srcdir}"/basilisk/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/basilisk-gtk2.png
}
