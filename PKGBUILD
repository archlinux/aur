#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno-reto.
# Based on the haveno PKGBUILD
# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
# Contributor: Matheus <matheusgwdl@protonmail.com>

_pkgname=haveno-reto
pkgname=retoswap
pkgver=1.2.3.1
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
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/$pkgver$_versuffix.tar.gz"
	"$pkgname.desktop")
sha512sums=('706179fc5d740b2c940dd0c8aa43dc934d241a497533531c46c6d97e378a2fd051650e1aea8b5f1af02e08a9b19f3d26459b97f62dcaa8979563111d127c2c5a'
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
