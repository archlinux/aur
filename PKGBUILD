# Maintainer: VConet <v-conet@outlook.com>
pkgname=open-cad-studio
_pkgname=OpenCADStudio
pkgver=0.9.3
pkgrel=1
pkgdesc="A CAD application built with Rust — 2D/3D drawing, DWG/DXF support, and GPU-accelerated rendering"
arch=('x86_64')
url="https://github.com/HakanSeven12/OpenCADStudio"
license=('GPL-3.0-only')
depends=('xz' 'git')
makedepends=('cargo')
source=(
	"$url/archive/refs/tags/v${pkgver}.tar.gz"
	"logo.png"
	"OpenCADStudio.desktop"
	)
sha256sums=(
	'f1eb577bb7d49183c6fb409f2bb1a21b68e2f517c9a6964eb84b4f55b1b561cc'
	'0d1be965a2d3d2b9013be97fd18b4e5bee92369547cf184c19de0629879f362b'
	'ad8b78df51f5bb346a41812b649b7f201c460c045982080c51539398fb9b2f93'
)
options=(!lto)
prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# export CARGO_PROFILE_RELEASE_LTO=false
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -Dm755 "target/release/OpenCADStudio" "$pkgdir/usr/bin/OpenCADStudio"
	install -Dm644 "$srcdir/OpenCADStudio.desktop" "$pkgdir/usr/share/applications/OpenCADStudio.desktop"
	install -Dm644 "$srcdir/logo.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/OpenCadStudio.png"
	install -Dm644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/OpenCadStudio.svg"
}
