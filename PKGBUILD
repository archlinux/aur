# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ebnf-convert
pkgver=0.73
pkgrel=1
pkgdesc='a tool for converting various forms of BNF and EBNF grammars to W3C-style EBNF'
arch=(any)
url="https://github.com/GuntherRademacher/$pkgname"
license=(Apache-2.0)
depends=(bash
         java-runtime)
makedepends=(gradle
             java-environment)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('1cead03dd284b6f2e61f72a633dc5faf4a21a979d3f96ebca4f3e9898399560a')

build() {
	cd "$_archive"
	gradle build --no-daemon war
}

package() {
	cd "$_archive"
	find -name '*.war' -type f
	local _sharedir="/usr/share/java/$pkgname"
	install -Dm0644 -t "$pkgdir/$_sharedir" "build/libs/$pkgname.war"
	cat <<- EOF | install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
		#!/usr/bin/env bash
		exec java -jar '$_sharedir/$pkgname.war' "\$@"
	EOF
}
