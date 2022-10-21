# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor:  twa022 <twa022 at gmail dot com>

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid=20220928143824
_date=2022.09.28
pkgver=52.9.$_date
pkgrel=1
pkgdesc="A XUL-based web-browser demonstrating the Unified XUL Platform (UXP)."
url="https://www.basilisk-browser.org"
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'gtk3' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
source=(https://archive.basilisk-browser.org/${_date}/linux/x86_64/gtk3/basilisk-${_buildid}.linux-x86_64.{tar.xz,json}
        'basilisk.desktop')
sha256sums=('a4e4c113146e62700f8f648622db00cf8e3a86968135b03a91757bcc6af769e1'
            '206207e228eb996ea8fe9819db51f5afa00a17f818c089057746b02545abe943'
            'c4223e966bc404467fece4a524cc2db3e99c12455087da2ade9a47b8d99d3a45')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

pkgver() {
	grep 'moz_app_version' "${srcdir}"/basilisk-${_buildid}.linux-x86_64.json | sed -e 's/.*:[\ \t]*"//;s/"[,]*[\ \t]*$//'
#	cd "$srcdir"/basilisk
#	./basilisk --version | grep -o -E '[0-9\.]+$'
}

package() {
	mkdir -p "$pkgdir"/opt
	cp -ar --no-preserve=ownership "$srcdir"/basilisk "$pkgdir"/opt
	mkdir -p "${pkgdir}"/usr/bin
	cat > "${pkgdir}"/usr/bin/basilisk <<- __EOF__
		#!/bin/bash
		/opt/basilisk/basilisk "\$@"
	__EOF__
	chmod 755 "${pkgdir}"/usr/bin/basilisk
	install -Dm644 "${srcdir}"/basilisk.desktop "${pkgdir}"/usr/share/applications/basilisk.desktop
	install -Dm644 "${srcdir}"/basilisk/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/basilisk.png
}
