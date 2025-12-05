#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno-reto.
# Based on the haveno PKGBUILD
# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
# Contributor: Matheus <matheusgwdl@protonmail.com>

_pkgname=haveno-reto
pkgname=retoswap
pkgver=1.2.2
_versuffix=-reto-app
pkgrel=2
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
sha512sums=('dc61d29371fd686fa52c7397d41f58a96c167ae5af16791237b1b0f6d7b7d6015628d68aee942b068491882596d5f013463ba349573eb10c6d86a855cea6db2e'
            '37148505c9801c21d5e410f6a54934e290c1e009f6eaf7ecc87447c599253b1865887243c88585ea3ebee2402a26abefe918945285ac2649166ea71f35fbb117')
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
