#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno-reto.
# Based on the haveno PKGBUILD
# Maintainer: Duje Mihanović <duje.mihanovic@skole.hr>
# Contributor: Matheus <matheusgwdl@protonmail.com>

_pkgname=haveno-reto
pkgname=retoswap
pkgver=1.1.1
pkgrel=1
pkgdesc='Decentralised P2P exchange built on Monero and Tor - unofficial Reto network'
arch=('any')
url="https://github.com/retoaccess1/$_pkgname"
license=('AGPL-3.0-or-later')
depends=('bash' 'java-runtime>=21')
makedepends=('jdk21-openjdk')
conflicts=('haveno' "$_pkgname")
replaces=("$_pkgname")
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"$pkgname.desktop")
sha512sums=('38a89d425e6c2d7b84d6ed12be1daa30b7cbc76d239e89899b831a93a713fe90a4c31748301ef67170ba7dfb026f7f144e7d18acd17d02e94261b847196aa17a'
            '37148505c9801c21d5e410f6a54934e290c1e009f6eaf7ecc87447c599253b1865887243c88585ea3ebee2402a26abefe918945285ac2649166ea71f35fbb117')
install="$pkgname.install"

build() {
	cd "$srcdir"/"$_pkgname"-"$pkgver"/ || exit 1
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
	cp -r "$srcdir"/"$_pkgname"-"$pkgver"/lib/ "$pkgdir"/usr/share/java/"$_pkgname"/

	declare -ar _binaries=("haveno-apitest" "haveno-cli" "haveno-daemon" "haveno-desktop" "haveno-inventory" "haveno-monitor" "haveno-relay" "haveno-seednode" "haveno-statsnode")

	for _binary in "${_binaries[@]}"; do
		install -Dm755 "$srcdir"/"$_pkgname"-"$pkgver"/"$_binary" "$pkgdir"/usr/share/java/"$_pkgname"/
		ln -s /usr/share/java/"$_pkgname"/"$_binary" "$pkgdir"/usr/bin/
	done

	install -Dm644 "$srcdir"/"$_pkgname"-"$pkgver"/desktop/package/linux/icon.png "$pkgdir"/usr/share/pixmaps/"$pkgname".png
	install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop

	# Install the documentation.
	cp -r "$srcdir"/"$_pkgname"-"$pkgver"/docs/* "$pkgdir"/usr/share/doc/"$_pkgname"/
	find "$pkgdir"/usr/share/doc/"$_pkgname"/ -type d -exec chmod 755 {} +
	find "$pkgdir"/usr/share/doc/"$_pkgname"/ -type f -exec chmod 644 {} +
}
