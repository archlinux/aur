# shellcheck shell=bash disable=SC2034
# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=mimaflux
pkgver=1.1.0
_tagname=${pkgver%.0}
pkgrel=1
pkgdesc='debugger for Mima assembly code'
arch=('any')
url="https://github.com/mattulbrich/mimaflux"
license=('GPL3')
depends=('java-runtime>=16')
makedepends=('gradle')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_tagname.tar.gz"
	versionFile_without_git_commit_hash.patch
	mimaflux
)
sha256sums=('ec3b65ae275853357abc605c96595087d1da0036e7e886f50c639d1952644a9b'
            '1acf49a88fb09064736d84161ffb52200de1729a8c561f34a4a507a7cc344ffa'
            '45f965e7748262f4f366e36fedac2fb4296cfdd01607633636a92095b6d51d2e')

prepare() {
	# needed to make the versionFile task in gradle pass
	patch --directory="$pkgname-$_tagname" --forward --input="$srcdir/versionFile_without_git_commit_hash.patch"
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
