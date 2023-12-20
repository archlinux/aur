# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-gtk2-bin
epoch=1
_buildid=20231210185501
_date=2023.12.09
pkgver=52.9.2023.12.09
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
sha256sums=('ae28bd4a7605d53aca76b5e083d080792c35783792aeb4c72e5389b16624d425'
            '842bd752800b22e1d76dd21406d6ba8b93977d657045beece8c1e6e07624584a'
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
