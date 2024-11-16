#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno-reto.
# Based on the haveno PKGBUILD
# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname=haveno-reto
pkgver=1.0.14
pkgrel=2
pkgdesc='Decentralised P2P exchange built on Monero and Tor - unofficial Reto network'
arch=('any')
url="https://github.com/retoaccess1/${pkgname}"
license=('AGPL-3.0-or-later')
depends=('bash' 'java-runtime>=21')
makedepends=('java-environment>=21')
conflicts=('haveno')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.desktop")
sha512sums=(bfee08a8162f693975d51d54770d3f00582507b74d8260f9808adf0f5b225f89cea1c62de6d499bf2ae498b635df86f428879c75443fdc6f576be9f8fd88831c
	90103d36dfbc4d5da1c16774a9474c5e4b9bcc9d9354d35060187aa89176989119a7ec83bd36beca9e79103aae5329db72bf981a622be1daf248bb6dffceae5c)
install="${pkgname}.install"

prepare() {
	sed -i 's/8.6/8.10/' $pkgname-$pkgver/gradle/wrapper/gradle-wrapper.properties
}

build() {
	local jdkver=$(archlinux-java get)
	if [[ ! $jdkver = java-2[1-3]* ]]; then
		echo Haveno requires JDK 21-23.
		echo Please select a JDK with version 21-23 using archlinux-java.
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
