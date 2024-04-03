# shellcheck shell=bash disable=SC2034
# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=mimaflux
pkgver=1.1.0
_tagname=${pkgver%.0}
pkgrel=2
pkgdesc='debugger for Mima assembly code'
arch=('any')
url="https://github.com/mattulbrich/mimaflux"
license=('GPL-3.0-only')
depends=('java-runtime>=17' 'sh')
makedepends=('java-environment=17' 'gradle<9')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_tagname.tar.gz"
	make_it_build.patch
	mimaflux
)
sha256sums=('ec3b65ae275853357abc605c96595087d1da0036e7e886f50c639d1952644a9b'
            '8986f87b83e33daecb509cd900e46f13385e4baad8d8b78905d2e0d8cc60d7ac'
            '45f965e7748262f4f366e36fedac2fb4296cfdd01607633636a92095b6d51d2e')

prepare() {
	# needed to make the versionFile task in gradle pass
	patch --directory="$pkgname-$_tagname" --forward --input="$srcdir/make_it_build.patch"
}

build() {
	cd "$pkgname-$_tagname"
	gradle -Dorg.gradle.daemon=false shadowJar
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin" mimaflux
	cd "$pkgname-$_tagname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/java/$pkgname" "build/libs/mimaflux-$pkgver-all.jar"
}
