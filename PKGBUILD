# Maintainer: Uyanide <me@uyani.de>
pkgname=oavif
pkgver=0.1.3
pkgrel=1
pkgdesc='Target quality AVIF encoding'
arch=('x86_64')
url='https://github.com/gianni-rosato/oavif'
license=('Apache-2.0')
depends=(
	'glibc'
	'libavif'
	'libwebp'
	'libjpeg-turbo'
	'libspng'
)
makedepends=(
	'zig'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gianni-rosato/oavif/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f9f462a60ca08a59cd1d6576ad1440be3167bd3d5dd77ca950cdb7e71f62d50e')

prepare() {
	cd "${pkgname}-${pkgver}"
	# Bake version
	sed -i 's/"unknown"/"'"${pkgver}"'"/g' build.zig
	# Prefer dynamic
	sed -i 's/\.preferred_link_mode = \.static/.preferred_link_mode = .dynamic/g' build.zig
	# Enable PIE
	sed -i 's|b\.installArtifact(bin);|bin.pie = true;\n    b.installArtifact(bin);|' build.zig
}

build() {
	# Do nothing since `zig build --prefix` handled both building and installing in one shot
	true
}

package() {
	cd "${pkgname}-${pkgver}"
	zig build --release=fast --prefix "$pkgdir/usr"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
