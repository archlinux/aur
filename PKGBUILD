#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno-reto.
# Based on the haveno PKGBUILD
# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
# Contributor: Matheus <matheusgwdl@protonmail.com>

_pkgname=haveno-reto
pkgname=retoswap
pkgver=1.0.17
pkgrel=1
pkgdesc='Decentralised P2P exchange built on Monero and Tor - unofficial Reto network'
arch=('any')
url="https://github.com/retoaccess1/$_pkgname"
license=('AGPL-3.0-or-later')
depends=('bash' 'java-runtime>=21')
makedepends=('java-environment>=21')
conflicts=('haveno' "$_pkgname")
replaces=("$_pkgname")
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.desktop")
sha512sums=('bf02aa1b24a8526c2e193e361eba2d62c0bf2ca24f0a62b7d9e4fb0fb664835f1fb05a80b67c188ae36cc63190542f099a1d67ffcabcd32b2ae4e8249852d100'
            '37148505c9801c21d5e410f6a54934e290c1e009f6eaf7ecc87447c599253b1865887243c88585ea3ebee2402a26abefe918945285ac2649166ea71f35fbb117')
install="$pkgname.install"

prepare() {
	sed -i s/8.6/8.10/ "$srcdir"/"$_pkgname"-"$pkgver"/gradle/wrapper/gradle-wrapper.properties
}

build() {
	local jdkver=$(archlinux-java get)
	if [[ ! $jdkver = java-2[1-3]* ]]; then
		echo RetoSwap can only be built with JDK 21-23.
		echo Please select a JDK with version 21-23 using archlinux-java.
		exit 1
	fi

	cd "$srcdir"/"$_pkgname"-"$pkgver"/ || exit 1
	./gradlew -F lenient -x test build
}

package() {
	# Assure that the directories exist.
	mkdir -p "$pkgdir"/usr/bin/
	mkdir -p "$pkgdir"/usr/share/applications/
	mkdir -p "$pkgdir"/usr/share/doc/"$_pkgname"/
	mkdir -p "$pkgdir"/usr/share/java/"$_pkgname"/bin/
	mkdir -p "$pkgdir"/usr/share/pixmaps/

	# Install the software.
	cp -r "$srcdir"/"$_pkgname"-"$pkgver"/lib/ "$pkgdir"/usr/share/java/"$_pkgname"/

	declare -ar _binaries=("haveno-apitest" "haveno-cli" "haveno-daemon" "haveno-desktop" "haveno-inventory" "haveno-monitor" "haveno-relay" "haveno-seednode" "haveno-statsnode")

	for _binary in "${_binaries[@]}"; do
		install -Dm755 "$srcdir"/"$_pkgname"-"$pkgver"/"$_binary" "$pkgdir"/usr/share/java/"$_pkgname"/bin/
		ln -s /usr/share/java/"$_pkgname"/bin/"$_binary" "$pkgdir"/usr/bin/
	done

	install -Dm644 "$srcdir"/"$_pkgname"-"$pkgver"/desktop/package/linux/icon.png "$pkgdir"/usr/share/pixmaps/"$pkgname".png
	install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop

	# Install the documentation.
	cp -r "$srcdir"/"$_pkgname"-"$pkgver"/docs/* "$pkgdir"/usr/share/doc/"$_pkgname"/
	find "$pkgdir"/usr/share/doc/"$_pkgname"/ -type d -exec chmod 755 {} +
	find "$pkgdir"/usr/share/doc/"$_pkgname"/ -type f -exec chmod 644 {} +
}
