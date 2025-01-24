# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20250103024753
_buildid_i686=20250103024756
_buildid_aarch64=20250103024912
_date=2025.01.04
pkgver=52.9.2025.01.04
pkgrel=1
pkgdesc="A XUL-based web-browser demonstrating the Unified XUL Platform (UXP)."
url="https://www.basilisk-browser.org"
arch=('x86_64' 'aarch64' 'i686')
license=('GPL')
depends=('gtk2' 'gtk3' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu')
makedepends=('jq')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
source=('basilisk.desktop')
source_x86_64=(https://archive.basilisk-browser.org/${_date}/linux/x86_64/gtk3/basilisk-${_buildid_x86_64}.linux-x86_64-gtk3.{tar.xz,json})
source_aarch64=(https://archive.basilisk-browser.org/${_date}/linux/aarch64/gtk3/basilisk-${_buildid_aarch64}.linux-aarch64-gtk3.{tar.xz,json})
source_i686=(https://archive.basilisk-browser.org/${_date}/linux/i686/gtk3/basilisk-${_buildid_i686}.linux-i686-gtk3.{tar.xz,json})
sha256sums=('c4223e966bc404467fece4a524cc2db3e99c12455087da2ade9a47b8d99d3a45')
sha256sums_x86_64=('67b8bfbc9752bbabd2b99be2c9cb109fbf52547848f1f5732eec7e8bbf218086'
                   '0e7a5a1ce6020f32e16f3445ed06d2a030c3c8a87c2bbf272042f80f8f156e3e')
sha256sums_aarch64=('28c6358b43bf64003c99e2386b58d868ad0e65f7870d07296f1dcb3e79718500'
                    'ac1a4a54fdd9087bb7aa4e7e9411fb88a72d3a329cdbbcf8df78d2cfbf9af932')
sha256sums_i686=('a541c3b20b596a383cf3be2173087fd6c00fe3aaa6ba2651fa6b7d31988344cf'
                 '4a240af4ed44961cb58e0761a667289eecbd46cd8af299ada3aa8d88e5101144')
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
	jq -r '.moz_app_version' < "${srcdir}"/basilisk-${_buildid}.linux-x86_64-gtk3.json
#	cd "$srcdir"/basilisk
#	./basilisk --version | grep -o -E '[0-9\.]+$'
}

package() {
	mkdir -p "$pkgdir"/opt
	cp -ar --no-preserve=ownership "$srcdir"/basilisk "$pkgdir"/opt
	mkdir -p "${pkgdir}"/usr/bin
	cat > "${pkgdir}"/usr/bin/basilisk <<- __EOF__
		#!/bin/sh
		exec /opt/basilisk/basilisk "\$@"
	__EOF__
	chmod 755 "${pkgdir}"/usr/bin/basilisk
	install -Dm644 "${srcdir}"/basilisk.desktop "${pkgdir}"/usr/share/applications/basilisk.desktop
	install -Dm644 "${srcdir}"/basilisk/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/basilisk.png
}
