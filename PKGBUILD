# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
# SPDX-License-Identifier: 0BSD
pkgname=waypipe
pkgver=0.11.0
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications; like ssh -X'
arch=('x86_64')
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
license=('MIT')
makedepends=('meson' 'ninja' 'scdoc' 'shaderc' 'pkgconf' 'cargo' 'rust-bindgen' 'clang' 'vulkan-headers')
depends=('lz4' 'zstd' 'vulkan-icd-loader' 'mesa' 'ffmpeg')
optdepends=('openssh: recommended transport')
source=("https://gitlab.freedesktop.org/mstoeckl/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('dc4741bd4435666b4b45ef9b8354c9f742e9c2c5fb99bb49b2ac4f32a371bcd7')

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
