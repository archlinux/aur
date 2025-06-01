# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
# SPDX-License-Identifier: 0BSD
pkgname=waypipe
pkgver=0.10.4
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications; like ssh -X'
arch=('x86_64')
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
license=('MIT')
makedepends=('meson' 'ninja' 'scdoc' 'shaderc' 'pkgconf' 'cargo' 'rust-bindgen' 'clang' 'vulkan-headers')
depends=('lz4' 'zstd' 'vulkan-icd-loader' 'mesa' 'ffmpeg')
optdepends=('openssh: recommended transport')
source=("https://gitlab.freedesktop.org/mstoeckl/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('35226caf28d59331e1b0f08f3d723600870757ab3f32fa438e7012e22a7073ff')

build() {
	cargo fetch --locked --manifest-path "$pkgname-v$pkgver/Cargo.toml"
	mkdir -p build
	meson build "$pkgname-v$pkgver" --buildtype debugoptimized -Dwerror=false --prefix /usr
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
	install -Dm644 "$pkgname-v$pkgver/LICENSE.GPLv3" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
