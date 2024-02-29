# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=exkeymo-web
pkgname=$_pkgname-git
pkgver=r131.361cea2
pkgrel=1
pkgdesc="Android external keyboard remapping without root"
arch=(any)
url=https://github.com/ris58h/exkeymo-web
license=(Unlicense)
depends=(java-runtime-common)
makedepends=(git java-runtime-common)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+$url#tag=361cea2381366a11527e4ca0a4fa30ce15e45bee")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname" || return 1

	./mvnw clean install
}

package() {
	cd "$_pkgname" || return 1

	local jar
	jar="$(cd target && ls exkeymo-web-*-jar-with-dependencies.jar)"
	install -Dm644 target/"$jar" -t "$pkgdir/usr/share/java"
	install -D ../../exkeymo-web.sh "$pkgdir/usr/bin/exkeymo-web"
	sed -i "s/exkeymo-web-*-jar-with-dependencies\.jar/$jar/g" "$pkgdir/usr/bin/exkeymo-web"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
