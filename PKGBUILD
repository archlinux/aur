# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pascal Ernster <aur at hardfalcon dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=libcyaml-git
pkgver=1.3.0+r630.5206ece
pkgrel=1
pkgdesc='C library for reading and writing YAML'
arch=('x86_64')
url='https://github.com/tlsa/libcyaml'
license=('ISC')
depends=('glibc' 'libyaml')
makedepends=('git')
provides=('libcyaml.so' 'libcyaml')
conflicts=('libcyaml')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local _tag="$(git tag | tail -n1 | sed 's/^v//')"
	local _rev="$(git rev-list --count HEAD)"
	local _commit="$(git rev-parse --short HEAD)"
	printf "%s+r%s.%s" "$_tag" "$_rev" "$_commit"
}

build() {
	cd "$pkgname"
	make VARIANT=release
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	make install VARIANT=release DESTDIR="$pkgdir/" PREFIX=/usr
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
