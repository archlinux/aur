# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=quarkdown
pkgver=1.4.0
pkgrel=1
_jdkver=21
pkgdesc='a Markdown based typesetting system'
arch=(any)
url="https://github.com/iamgio/$pkgname"
license=(Apache-2.0)
depends=(bash
         "java-runtime-openjdk=$_jdkver")
makedepends=(gradle
             "java-environment-openjdk=$_jdkver")
optdepends=('puppeteer: generate PDF output')
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        "$pkgname-$pkgver-$pkgrel.patch::https://github.com/iamgio/quarkdown/compare/v$pkgver...alerque:quarkdown:packageable.patch")
sha256sums=('ec46a6eb35f80e7f34a62c55345c32b78d1a07758f12b89d73ec5bf2b090c4f2'
            'ed1f50bba78042db3ef0b7a686bbb3aaff7a4ddc1d4291d342cc7cfc0af0eb2e')

prepare() {
	cd "$_archive"
	patch -p1 -i "../${source[1]%::*}"
}

build() {
	export JAVA_HOME="/usr/lib/jvm/java-$_jdkver-openjdk"
	export PATH="/usr/lib/jvm/java-$_jdkver-openjdk/bin:$PATH"
	cd "$_archive"
	gradle --no-daemon shadowJar
}

package() {
	cd "$_archive"
	local _sharedir="/usr/share/$pkgname"
	install -Dm0644 -t "$pkgdir/$_sharedir/java/" "build/libs/$pkgname.jar"
	install -Dm0644 -t "$pkgdir/$_sharedir/lib/qmd/" quarkdown-libs/src/main/resources/*.qmd
	cat <<- EOF | install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
		#!/usr/bin/env bash
		export JAVA_HOME="/usr/lib/jvm/java-$_jdkver-openjdk"
		exec java -jar '$_sharedir/java/$pkgname.jar' "\$@"
	EOF
}
