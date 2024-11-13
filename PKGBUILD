# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20241023020251
_buildid_i686=20241023020234
_buildid_aarch64=20241023135454
_date=2024.10.24
pkgver=52.9.2024.10.24
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
sha256sums_x86_64=('429d9a71aab0db3cb1d923a2a302ca3e72574960ade815ca2fa9a58f6de7de99'
                   'eef976b2893a7b0342692e617a6391f3dd8f30d690c3075aeaf1b9fcf1cd76b4')
sha256sums_aarch64=('82313299cf2fa2ac385132f11ef9d34966da541a984758fcaaf36ef83f5c3957'
                    '3d00e632c3af28f4cbf295cbd5710f6b0bce62bd017017bede5ee976845effa3')
sha256sums_i686=('668c17b8dc33930d2e09f793add8204be9642a1e0a39b38c90c39ad58266ccf7'
                 '5e6834bcdbf8a317baead07f2b0b59e3ccc9ed1339c9dfd2d2c40cf60e912c49')
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
