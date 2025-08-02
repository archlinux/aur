# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=quarkdown
pkgver=1.8.0
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
sha256sums=('bb63369ad5380fac9729723c68388ac0cf9f6afc768f6c8314a9d0dcaba891d7')

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
