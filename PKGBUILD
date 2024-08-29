# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20240815174944
_buildid_aarch64=20240815230950
_date=2024.08.16
pkgver=52.9.2024.08.16
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
sha256sums_x86_64=('48963b5cc9a2f0cebf615829e3244056ddf5d51dfe5584c4d86d5a36e40f8043'
                   '6ccd3f6f9dcdcfa70610bccfb8e18cca6f557098331008c052a350fee45775d1')
sha256sums_aarch64=('dd233793aa04ee6311125b196bcc3e263b129e378721e3a2925517d8c77af124'
                    'bfbc66fad6cc4db76b5f56ad374bef067856c19bac3ecaf1b2475c2507abfa50')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

pkgver() {
	case "$CARCH" in
		'x86_64')
			_buildid=${_buildid_x86_64} ;;
		'aarch64')
			_buildid=${_buildid_aarch64} ;;
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
