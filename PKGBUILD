# Maintainer: Gigas002 <gigas002@pm.me>

pkgname=imgvwr-git
_pkgname=imgvwr
pkgver=r112.5c81e5b
pkgrel=3
pkgdesc="Minimal Wayland image viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/Gigas002/$_pkgname"
license=('AGPL-3.0-only')
makedepends=('git' 'cargo' 'pkg-config')
depends=('wayland' 'libxkbcommon')
optdepends=('vulkan-icd-loader: GPU-accelerated rendering via Vulkan'
            'dav1d: animated AVIF support (rebuild with avif-anim feature)'
            'libjxl: JPEG XL support (rebuild with jxl or jxl-anim feature)')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	cargo build --release --features jpeg,webp,webp-anim,avif,avif-anim,jxl,jxl-anim,gif,apng,decorations,gpu-vulkan,dmabuf
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "docs/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
