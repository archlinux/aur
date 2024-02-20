# Maintainer: Rajdeep Malakar <rajdeepm.dev@gmail.com>

pkgname="brewkit"
pkgver=1.14.0
pkgrel=1
pkgdesc="the build infra for PKGX"
arch=("x86_64" "arm")
url="https://github.com/pkgxdev/brewkit"
license=("Apache-2.0")
depends=("pkgx" "git")
makedepends=(
	"deno" # For Compiling
)
provides=("brewkit")
conflicts=("brewkit")
source=("bk.sh" "fix-list.patch")
source=("$pkgname.tar.gz::https://github.com/pkgxdev/brewkit/archive/refs/tags/v$pkgver.tar.gz")
# BrewKit Wrapper Script
b2sums=(
	"728ca19ea88c2716eda7b66d5e3db55fa30daef9503820594d3a02555db15d4b7de5ff8fc030890e0ab7ad061ddf1cded7e3b030767efbf5cf9797fcd7fe41aa"
	"3558f018b5835ac52a2333e54a3b05a163c8cc8b40c7c62d4e4294cb9ce5c223aeae169224299264c3b13e3ac92815b7a33b17a5f11b349bd01fa99295554073"
)
# Main Source Archive
b2sums=(
	"92f6be9b0e32fcecfae8716acc7edf7e4acbb41d7f8fa9d6d1360b1f51ff9afeee07f5feade66a8ad1386e42b49879649c878b147125ab0b68cb801b55e266fd"
)
options=(!strip)

build() {
	mkdir -p "$srcdir/dist"
	cd "$pkgname-$pkgver"
	for x in bin libexec lib share deno.*; do
		test -e $x && mv $x "$srcdir/dist/"
	done
}

check() {
	true
}

package() {
	cd "$srcdir/dist"
	mkdir -p "$pkgdir/usr/local/bin"
	mkdir -p "$pkgdir/usr/share/brewkit"
	for x in bin libexec lib share deno.*; do
		test -e $x && cp -r $x "$pkgdir/usr/share/$pkgname/"
	done
	patch "$pkgdir/usr/share/$pkgname/bin/bk" "../../fix-list.patch"
	install -Dm755 "../../bk.sh" "$pkgdir/usr/local/bin/bk"
}
