# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=quarkdown
pkgver=1.7.0
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
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('dbbdca6335b3adb4176dec1a3ad2ccc5dcf02d2d607c9e8afc9152561baa7aef')

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
	install -Dm0644 -t "$pkgdir/$_sharedir/lib/qd/" quarkdown-libs/src/main/resources/*.qd
	cat <<- EOF | install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
		#!/usr/bin/env bash
		export JAVA_HOME='/usr/lib/jvm/java-$_jdkver-openjdk'
		export NODE_PATH='/usr/lib/node_modules'
		export QD_NPM_PREFIX='/usr/lib'
		exec java -jar '$_sharedir/java/$pkgname.jar' "\$@"
	EOF
}
