# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ebnf-rr
_pkgname=${pkgname##*-}
pkgver=2.4
pkgrel=1
pkgdesc='a railroad diagram generator for W3C-style EBNF grammars'
arch=(any)
url="https://github.com/GuntherRademacher/$_pkgname"
license=(Apache-2.0)
depends=(bash
         'java-runtime<22')
makedepends=(gradle
             'java-environment<22')
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('77e08e2174f3fa95c154bcbd9df641697d8bbc6bded34235e90853d71b630105')

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
