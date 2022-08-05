# Maintainer: Lucca Pellegrini <luccapellegrini@gmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=mepo-git
_pkgname=mepo
pkgver=0.4.1.250.gcd3c8e4
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer for Linux (development version)"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~mil/mepo"
license=('GPL3')
depends=('dmenu' 'jq' 'xdotool' 'curl' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx')
makedepends=('git' 'zig>=0.9')
checkdepends=('zig>=0.9')
provides=('mepo')
conflicts=('mepo')
changelog=
source=("$_pkgname"::"git+$url")
sha512sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\\([^-]*-g\\)/r\\1/;s/-/./g'
}

prepare() {
	patch --directory="$_pkgname" --forward --strip=1 --input="$startdir/remove_zig_version_check.patch"
}

build() {
	cd "$_pkgname"
	zig build -Drelease-safe=true
}

check() {
	cd "$_pkgname"
	zig build test
}

package() {
	cd "$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	install scripts/mepo_* "$pkgdir/usr/bin/"
	install "zig-out/bin/mepo" "$pkgdir/usr/bin/"
}
