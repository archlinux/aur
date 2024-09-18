# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20240912184357
_buildid_i686=20240912184341
_buildid_aarch64=20240912185821
_date=2024.09.13
pkgver=52.9.2024.09.13
pkgrel=1
pkgdesc="A XUL-based web-browser demonstrating the Unified XUL Platform (UXP)."
url="https://www.basilisk-browser.org"
arch=('x86_64' 'aarch64' 'i686')
license=('GPL')
depends=('gtk2' 'gtk3' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
source=('basilisk.desktop')
source_x86_64=(https://archive.basilisk-browser.org/${_date}/linux/x86_64/gtk3/basilisk-${_buildid_x86_64}.linux-x86_64-gtk3.{tar.xz,json})
source_aarch64=(https://archive.basilisk-browser.org/${_date}/linux/aarch64/gtk3/basilisk-${_buildid_aarch64}.linux-aarch64-gtk3.{tar.xz,json})
source_i686=(https://archive.basilisk-browser.org/${_date}/linux/i686/gtk3/basilisk-${_buildid_i686}.linux-i686-gtk3.{tar.xz,json})
sha256sums=('c4223e966bc404467fece4a524cc2db3e99c12455087da2ade9a47b8d99d3a45')
sha256sums_x86_64=('ac680d08e163aa0f102e5e45b06bfefced7ca058ba6651832c9020cc2f7de196'
                   'eadfcbddbe71a735510ebf8576268ec553ee72fb0570ce3a957322cf3d4f96ea')
sha256sums_aarch64=('ac8ba9bb88f42532b554b4913724ed5b8fa75e2b7f0366548a40510144ae8e6f'
                    '6551b6aed384175a313e8b9f4f38e99c84f5b3ceaebb65c8b77f478a569f9a8a')
sha256sums_i686=('5f96921ed30e4746213eae5c77cfee219d36ac9b0115228db7e563e8a7dc71ce'
                 '68f3ce6892501826afb499809d50ad8de326cb5ad0225a50abb370d727120b76')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

pkgver() {
	case "$CARCH" in
		'x86_64')
			_buildid=${_buildid_x86_64} ;;
		'aarch64')
			_buildid=${_buildid_aarch64} ;;
		'i686')
			_buildid=${_buildid_i686} ;;
		*) exit 1 ;;
	esac
	grep 'moz_app_version' "${srcdir}"/basilisk-${_buildid}.linux-x86_64-gtk3.json | sed -e 's/.*:[\ \t]*"//;s/"[,]*[\ \t]*$//'
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
