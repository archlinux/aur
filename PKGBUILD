# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=waypipe-git
pkgver=0.7.0.r0.g5eef66b
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications. WARNING: unstable'
license=('MIT')
# minimal build: only 'wayland' 'wayland-protocols' 'meson' 'ninja'
makedepends=('git' 'wayland' 'meson' 'ninja' 'scdoc' 'wayland-protocols' 'libdrm')
depends=('lz4' 'zstd' 'mesa' 'ffmpeg' 'libva')
optdepends=(
	'openssh: recommended transport'
	'systemtap: a makedepend, for tracing hooks'
)
checkdepends=('weston' 'python-psutil')
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
source=('git+https://gitlab.freedesktop.org/mstoeckl/waypipe.git')
sha512sums=('SKIP')
options=(debug !strip)
arch=('any')
provides=('waypipe')
conflicts=('waypipe')

pkgver() {
	cd waypipe
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd waypipe
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
