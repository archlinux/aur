# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid=20230307200707
_date=2023.03.07
pkgver=52.9.2023.03.07
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
sha256sums=('aa6f8b10c953556cb263f5c0804b1cd04e57e834f467cfe466960c3a20c03a52'
            '76fb26c6c2683355029ca6aa8eedc17374eba2c935b42bb80182de4da1976138'
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
