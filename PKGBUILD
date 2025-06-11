
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=KeenWrite
pkgname=${_pkgname,,}
pkgver=3.5.13
pkgrel=0
_jdkver=23
pkgdesc='desktop Markdown text editor with live preview, string interpolation, and math'
arch=(any)
url="https://$pkgname.com/"
_url="https://gitlab.com/DaveJarvis/$_pkgname"
license=(BSD-2-Clause)
depends=(bash
         "java-runtime-openjdk=$_jdkver")
makedepends=(gradle
             "java-environment-openjdk=$_jdkver")
optdepends=('texlive-context: generate PDF output')
_archive="$_pkgname-$pkgver"
source=("$_url/-/archive/$pkgver/$_archive.tar.bz2")
sha256sums=('adef6493a409d4fe7bed0aaf91cf95a0d53bec08cdc3e022e511baebe19706d0')

prepare() {
	cd "$_archive"
	sed -i -e "s/gitVersion()/'$pkgver'/" build.gradle
}

build() {
	export JAVA_HOME="/usr/lib/jvm/java-$_jdkver-openjdk"
	export PATH="/usr/lib/jvm/java-$_jdkver-openjdk/bin:$PATH"
	cd "$_archive"
	gradle --no-daemon jar
}

package() {
	cd "$_archive"
	local _sharedir="/usr/share/$pkgname"
	install -Dm0644 -t "$pkgdir/$_sharedir/" "build/libs/$pkgname.jar"
	install -Dm0755 -t "$pkgdir/$_sharedir/" "$pkgname.sh"
	cat <<- EOF | install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
		#!/usr/bin/env bash
		export JAVA_HOME='/usr/lib/jvm/java-$_jdkver-openjdk'
		exec '$_sharedir/$pkgname.sh' "\$@"
	EOF
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
