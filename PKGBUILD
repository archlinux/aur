# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20240203205403
_buildid_aarch64=20240203213910
_date=2024.02.03
pkgver=52.9.2024.02.03
pkgrel=1
pkgdesc="A XUL-based web-browser demonstrating the Unified XUL Platform (UXP)."
url="https://www.basilisk-browser.org"
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('gtk2' 'gtk3' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
source=('basilisk.desktop')
source_x86_64=(https://archive.basilisk-browser.org/${_date}/linux/x86_64/gtk3/basilisk-${_buildid_x86_64}.linux-x86_64-gtk3.{tar.xz,json})
source_aarch64=(https://archive.basilisk-browser.org/${_date}/linux/aarch64/gtk3/basilisk-${_buildid_aarch64}.linux-aarch64-gtk3.{tar.xz,json})
sha256sums=('c4223e966bc404467fece4a524cc2db3e99c12455087da2ade9a47b8d99d3a45')
sha256sums_x86_64=('5a0aa97524e5e837b43df339ee90329b484bd3e190666a56090fc50dd64b1c6a'
                   '82830e50c14729fbd5a0c15b8f0ce18db20a3345dbfacaa18c4ea4b5cd4dce9f')
sha256sums_aarch64=('4fdfa512ef722bf7026c61d4f3050eecd2a547d2d3b46e013f835e61889a791f'
                    'a7e90f001438bade53ffef24104fc6e16fe5351b583aa4acb47fedd3ba93751a')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

pkgver() {
	grep 'moz_app_version' "${srcdir}"/basilisk-*.json | sed -e 's/.*:[\ \t]*"//;s/"[,]*[\ \t]*$//'
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
