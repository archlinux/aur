# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=quarkdown
pkgver=1.3.1
pkgrel=2
_jdkver=11
pkgdesc='a Markdown based typesetting system'
arch=(any)
url="https://github.com/iamgio/$pkgname"
license=(Apache-2.0)
depends=(bash
         "java-runtime=$_jdkver")
makedepends=(gradle
             "java-environment=$_jdkver")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6abfeaf7ce5fb68c070e02aa1afe627a5dbad12259d6e3f4dc906c3582d126c6')

build() {
	cd "$_archive"
	gradle --no-daemon assemble jar
}

package() {
	cd "$_archive"
	local _sharedir="/usr/share/java/$pkgname"
	install -Dm0644 -t "$pkgdir/$_sharedir" "build/libs/$pkgname.jar"
	bsdtar xvf build/distributions/$pkgname.zip -C "$pkgdir/$_sharedir/../"
	mkdir -p "$pkgdir/usr/share/docs/"
	mv "$pkgdir/$_sharedir/" "$pkgdir/usr/share/docs/$pkgname"
	cat <<- EOF | install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
		#!/usr/bin/env bash
		exec $_sharedir/bin/$pkgname "\$@"
	EOF
}

