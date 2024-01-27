# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ebnf-rr
_pkgname=${pkgname##*-}
pkgver=2.1
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
sha256sums=('a3b630bbf64aaa91247a57f3b94da63c5aeac32b94543d62d12bac6bfa353a03')

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
