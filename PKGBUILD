# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20241122173308
_buildid_i686=20241122173312
_buildid_aarch64=20241122173417
_date=2024.11.23
pkgver=52.9.2024.11.23
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
sha256sums_x86_64=('9d644a1a35f3fd2b5e6951727cdbdff1561ede137f3c47418f967323509901c4'
                   '1ee4e3bf531f3c6428cc5c5582484b61a35118273770081c15534762d90cf24b')
sha256sums_aarch64=('22985829c65d33f65b1f4979564e0cce3e9617acaebf8b89c35f8da32bb3500c'
                    'b5a24d1ae38799c90db32a85341af6ac2c0ea03f0c4386259c2e6a4a746e2f7f')
sha256sums_i686=('fc95864dfaf443d79462cf7a12fcf464a0ae80a96cf29da73740671110864e0d'
                 '1ec473e78624f2780aef74ea783d61441e6a459faf3d4a59781c100f25ad6262')
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
