#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno-reto.
# Based on the haveno PKGBUILD
# Maintainer: Duje Mihanović <duje@dujemihanovic.xyz>
# Contributor: Matheus <matheusgwdl@protonmail.com>

_pkgname=haveno-reto
pkgname=retoswap
pkgver=1.13.0
_versuffix=-reto
pkgrel=1
pkgdesc='Decentralised P2P exchange built on Monero and Tor - unofficial Reto network'
arch=('any')
url="https://github.com/retoaccess1/$_pkgname"
license=('AGPL-3.0-or-later')
depends=('bash' 'java-runtime>=21')
makedepends=('jdk21-openjdk')
conflicts=('haveno' "$_pkgname")
replaces=("$_pkgname")
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver$_versuffix.tar.gz"
	"$pkgname.desktop")
sha512sums=('84b46ecc9a3deaf7581b841c5a6020000c794ab9ad9ea5a3a3909d05eacb60d84e133074a4f2797a7c538d23931ad5e78b5d64a2d9ad2737043cf40568d8cf5b'
            'c6115853745acdb9c4bcf8dbf1e8479aa01131bc05641123cf45bf3fc6029e4edb0ce3930a3c372389e02a51874d686b6cc45166de1d9bba631e6e60c070ecd7')
install="$pkgname.install"

build() {
	cd "$srcdir"/"$_pkgname"-"$pkgver""$_versuffix"/ || exit 1
	JAVA_HOME=/usr/lib/jvm/java-21-openjdk ./gradlew -F lenient -x test build
}

package() {
	# Assure that the directories exist.
	mkdir -p "$pkgdir"/usr/bin/
	mkdir -p "$pkgdir"/usr/share/applications/
	mkdir -p "$pkgdir"/usr/share/doc/"$_pkgname"/
	mkdir -p "$pkgdir"/usr/share/java/"$_pkgname"/
	mkdir -p "$pkgdir"/usr/share/pixmaps/

	# Install the software.
	cp -r "$srcdir"/"$_pkgname"-"$pkgver$_versuffix"/lib/ "$pkgdir"/usr/share/java/"$_pkgname"/

	declare -ar _binaries=("haveno-apitest" "haveno-cli" "haveno-daemon" "haveno-desktop" "haveno-inventory" "haveno-monitor" "haveno-relay" "haveno-seednode" "haveno-statsnode")

	for _binary in "${_binaries[@]}"; do
		install -Dm755 "$srcdir"/"$_pkgname"-"$pkgver$_versuffix"/"$_binary" "$pkgdir"/usr/share/java/"$_pkgname"/
		ln -s /usr/share/java/"$_pkgname"/"$_binary" "$pkgdir"/usr/bin/
	done

	install -Dm644 "$srcdir"/"$_pkgname"-"$pkgver$_versuffix"/desktop/package/linux/icon.png "$pkgdir"/usr/share/pixmaps/"$pkgname".png
	install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop

	# Install the documentation.
	cp -r "$srcdir"/"$_pkgname"-"$pkgver$_versuffix"/docs/* "$pkgdir"/usr/share/doc/"$_pkgname"/
	find "$pkgdir"/usr/share/doc/"$_pkgname"/ -type d -exec chmod 755 {} +
	find "$pkgdir"/usr/share/doc/"$_pkgname"/ -type f -exec chmod 644 {} +
}
