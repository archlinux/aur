#!/bin/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=2.5.5
_upstream_pkgrel=1
pkgrel=2
pkgdesc="Slovak eID Web Signer by Disig"
arch=('i686' 'x86_64')
license=('LicenseRef-custom')
url="https://qesportal.sk/"
source_x86_64=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}_amd64.deb")
source_i686=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${pkgver}-${_upstream_pkgrel}_i386.deb")
sha256sums_i686=('82cd99ddbbaff71ee3f6cc1f45ca506253a1a56e4d522d915b405add3643c3a4')
sha256sums_x86_64=('f96101ddb9ffbb39810466d71c1196b416b29b221b65334aef66d9280fe7e521')
options=("!debug" "!strip")

: "${arch[@]}"
: "${license[@]}"
: "${options[@]}"
: "${pkgdesc}"
: "${pkgrel}"
: "${sha256sums_i686[@]}"
: "${sha256sums_x86_64[@]}"
: "${source_i686[@]}"
: "${source_x86_64[@]}"
: "${url}"

# Upstream uses Debian architecture naming convention. Let's prepare a variable for that.
_upstream_arch=
[[ "$CARCH" == "x86_64" ]] && _upstream_arch="amd64"
[[ "$CARCH" == "i686" ]] && _upstream_arch="i386"

package() {
	depends=(
		glibc
		libgcc_s.so
		libstdc++.so
		openssl-1.1
		qt5-base
		qt5-websockets
		qt5-xmlpatterns
		sh
	)
	optdepends=(
		"gnome-shell-extension-appindicator: for system tray icon on GNOME"
	)

	: "${depends[@]}"
	: "${optdepends[@]}"
	: "${pkgdir:?}"
	: "${srcdir:?}"

	ar p "${srcdir}/disig-web-signer_${pkgver}-${_upstream_pkgrel}_${_upstream_arch}.deb" data.tar.xz | tar -xJ -C "${pkgdir}"

	# The libraries are provided by the system.
	rm -r "${pkgdir}"/opt/disig/websigner/{bin/qt.conf,lib,plugins,share/doc/*/}

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/disig/websigner/share/doc/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
