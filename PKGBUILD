#!/bin/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=2.6.1_1
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Slovak eID Web Signer by Disig"
arch=('x86_64')
license=('LicenseRef-custom')
url="https://qesportal.sk/"
_depends=(
	glibc
	qt6-base
	qt6-websockets
	sh
	xdg-utils # xdg-open.sh
)
source_x86_64=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${_pkgver}_amd64.deb")
sha256sums_x86_64=('9a13879952399321889c59cef13404d588cab1c154505dd6f62e3c638e493e37')
options=("!debug" "!strip")

declare -gA _soname_depends=(
	["libgcc"]="libgcc_s.so"
	["libstdc++"]="libstdc++.so"
	["libxml2-legacy"]="libxml2.so"
	["openssl"]="libcrypto.so libssl.so"
)
checkdepends=(
	"${_depends[@]}"
	"${!_soname_depends[@]}"
)

: "${arch[@]}"
: "${checkdepends[@]}"
: "${license[@]}"
: "${options[@]}"
: "${pkgdesc}"
: "${pkgrel}"
: "${sha256sums_x86_64[@]}"
: "${source_x86_64[@]}"
: "${url}"

prepare() {
	rm -rf "${pkgname}_${_pkgver}"
	mkdir "${pkgname}_${_pkgver}"

	bsdtar \
		--directory "${pkgname}_${_pkgver}" \
		--file data.tar.zst \
		`# The libraries are provided by the system.` \
		--exclude=opt/disig/websigner/{bin/qt.conf,"lib/*","plugins/*","share/doc/*/*"} \
		--extract
}

check() {
	cd "${pkgname}_${_pkgver}/opt/disig/websigner/bin"

	export QT_QPA_PLATFORM=offscreen

	find . \
		-type f \
		-executable \
		! -name 'WebSigner*.sh' \
		-print0 |
		xargs -0 -I{} env {} --version
}

package() {
	# shellcheck disable=SC2206
	depends=(
		"${_depends[@]}"
		${_soname_depends[@]}
	)
	optdepends=(
		"gnome-shell-extension-appindicator: for system tray icon on GNOME"
	)

	: "${depends[@]}"
	: "${optdepends[@]}"
	: "${pkgdir:?}"

	cp -a "${pkgname}_${_pkgver}/." "${pkgdir}"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/disig/websigner/share/doc/copyright "${pkgdir}/usr/share/licenses/${pkgname}"
}
