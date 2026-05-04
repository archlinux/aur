# Maintainer: Uyanide <me@uyani.de>
pkgname=oavif-git
pkgver=0.1.3.r18.gd1fc680
pkgrel=1
pkgdesc='Target quality AVIF encoding (git)'
arch=('x86_64')
url='https://github.com/gianni-rosato/oavif'
license=('Apache-2.0')
depends=(
	'glibc'
	'libavif'
	'libwebp'
	'libjpeg-turbo'
	'libspng'
	'libheif'
)
makedepends=(
	'git'
	'zig'
)
provides=('oavif')
conflicts=('oavif')
options=('!debug')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	sed -i 's/\.preferred_link_mode = \.static/.preferred_link_mode = .dynamic/g' build.zig
	sed -i 's|b\.installArtifact(bin);|bin.pie = true;\n    b.installArtifact(bin);|' build.zig
}

package() {
	cd "${pkgname%-git}"
	zig build --release=fast --prefix "$pkgdir/usr"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
