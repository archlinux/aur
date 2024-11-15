#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno-reto.
# Based on the haveno PKGBUILD
# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname=haveno-reto
pkgver=1.0.13
pkgrel=1
pkgdesc='Decentralised P2P exchange built on Monero and Tor - unofficial Reto network'
arch=('any')
url="https://github.com/retoaccess1/${pkgname}"
license=('AGPL-3.0-or-later')
depends=('bash' 'java-runtime>=21')
makedepends=('java-environment=21')
conflicts=('haveno')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.desktop")
sha512sums=(a4423f0b74b1f3a87e7013c9c5892dd188c39bdbcb37c9f1b6d483ffa90def879008d823069dc594bf9fef0e53f21de05e5e66f22e9046b68f73a608337b3899
	90103d36dfbc4d5da1c16774a9474c5e4b9bcc9d9354d35060187aa89176989119a7ec83bd36beca9e79103aae5329db72bf981a622be1daf248bb6dffceae5c)
install="${pkgname}.install"

build() {
	local jdkver=$(archlinux-java get)
	if [[ ! $jdkver = java-21* ]]; then
		echo Haveno can currently only be built with JDK 21.
		echo Please select a JDK with version 21 using archlinux-java.
		exit 1
	fi

	cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
	./gradlew -F lenient -x test build
}

package() {
	# Assure that the directories exist.
	mkdir -p "${pkgdir}"/usr/bin/
	mkdir -p "${pkgdir}"/usr/share/applications/
	mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
	mkdir -p "${pkgdir}"/usr/share/java/"${pkgname}"/
	mkdir -p "${pkgdir}"/usr/share/pixmaps/

	# Install the software.
	cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/lib/ "${pkgdir}"/usr/share/java/"${pkgname}"/

	declare -ar _binaries=("haveno-apitest" "haveno-cli" "haveno-daemon" "haveno-desktop" "haveno-inventory" "haveno-monitor" "haveno-relay" "haveno-seednode" "haveno-statsnode")

	for _binary in "${_binaries[@]}"; do
	install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/"${_binary}" "${pkgdir}"/usr/share/java/"${pkgname}"/
	ln -s /usr/share/java/"${pkgname}"/"${_binary}" "${pkgdir}"/usr/bin/
	done

	install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/desktop/package/linux/icon.png "${pkgdir}"/usr/share/pixmaps/"${pkgname}".png
	install -Dm644 "${srcdir}"/"${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop

	# Install the documentation.
	cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
	find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
	find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
