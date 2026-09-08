# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=quarkdown
pkgver=2.6.0
pkgrel=2
_jdkver=21
pkgdesc='a Markdown based typesetting system'
arch=(any)
url="https://github.com/iamgio/$pkgname"
license=(AGPL-3.0-only)
depends=(bash
         "java-runtime-openjdk=$_jdkver")
makedepends=(nodejs-lts-krypton
             npm
             "java-environment-openjdk=$_jdkver")
optdepends=('chromium: generate PDF output')
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('67f12e2ef33d62daf80b74e20e634ded1c02c7d4d2a62ed7bdf5e89192f883e0')

build() {
	export JAVA_HOME="/usr/lib/jvm/java-$_jdkver-openjdk"
	export PATH="/usr/lib/jvm/java-$_jdkver-openjdk/bin:$PATH"
	cd "$_archive"
	npm install-scripts approve --all
	./gradlew --no-daemon installDist
}

package() {
	cd "$_archive"
	local _sharedir="/usr/share/$pkgname"
	mkdir -p "$pkgdir/$_sharedir"
	cp -a build/install/quarkdown/lib "$pkgdir/$_sharedir/"
	cat <<- EOF | install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
		#!/usr/bin/env bash
		export JAVA_HOME='/usr/lib/jvm/java-$_jdkver-openjdk'
		export QD_CHROME_PATH='/usr/bin/chromium'
		exec java -cp '$_sharedir/lib/*' com.quarkdown.cli.QuarkdownCliKt "\$@"
	EOF
}
