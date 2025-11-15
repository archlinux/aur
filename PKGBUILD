# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
# SPDX-License-Identifier: 0BSD
pkgname=waypipe-git
pkgver=0.10.5.r10.ga2d13ec
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications; like ssh -X'
license=('GPL-3.0-or-later')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'shaderc' 'pkgconf' 'cargo' 'rust-bindgen' 'clang' 'vulkan-headers')
depends=('lz4' 'zstd' 'vulkan-icd-loader' 'mesa' 'ffmpeg')
checkdepends=('vulkan-validation-layers')
optdepends=(
	'openssh: recommended transport'
	'xwayland-satellite: for remote X11-to-wayland conversion option'
)
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
source=('git+https://gitlab.freedesktop.org/mstoeckl/waypipe.git')
sha512sums=('SKIP')
# git may be less stable than releases, so enable debuginfo
options=(debug)
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
provides=('waypipe')
conflicts=('waypipe')

pkgver() {
	cd waypipe
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd waypipe
	cargo fetch --locked
	cd ../
	# Use 'meson' instead of 'arch-meson', because the latter sets
	# a 'plain' buildtype but environment variables configuring build
	# are only set for C, not for Rust
	meson setup waypipe "$srcdir/build" --buildtype debugoptimized -Dwerror=false --prefix /usr
}

check() {
	cd "$srcdir/build"
	meson test
}

build() {
	cd waypipe
	ninja -C "$srcdir/build"
}

package() {
	cd waypipe
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
