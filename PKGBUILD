# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ebnf-rr
_pkgname=${pkgname##*-}
pkgver=2.6
pkgrel=1
pkgdesc='a railroad diagram generator for W3C-style EBNF grammars'
arch=(any)
url="https://github.com/GuntherRademacher/$_pkgname"
license=(Apache-2.0)
depends=(bash
         java-runtime)
makedepends=(gradle
             java-environment)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('9b2e1b4a0699bdd111b1ff263b98f2e50434601c9a200cbd92b9c471cde6b892')

build() {
	cd "$_archive"
	gradle build --no-daemon war
}

package() {
	cd "$_archive"
	local _sharedir="/usr/share/java/$pkgname"
	install -Dm0644 -t "$pkgdir/$_sharedir" "build/libs/$_pkgname.war"
	cat <<- EOF | install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
		#!/usr/bin/env bash
		exec java -jar '$_sharedir/$_pkgname.war' "\$@"
	EOF
}
