# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=waypipe-git
pkgver=0.9.2.r14.g2fdae7a
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications; like ssh -X'
license=('MIT')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'shaderc' 'pkgconf' 'cargo')
depends=('lz4' 'zstd' 'vulkan-icd-loader' 'vulkan-headers' 'ffmpeg')
optdepends=(
	'openssh: recommended transport'
)
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
source=('git+https://gitlab.freedesktop.org/mstoeckl/waypipe.git')
sha512sums=('SKIP')
options=(debug !strip)
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
	meson --buildtype debugoptimized -Dwerror=false --prefix /usr "$srcdir/build"
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
