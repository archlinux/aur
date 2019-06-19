# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=waypipe-git
pkgver=0.1.0.r64.g50aee6b
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications. WARNING: very unstable'
license=('MIT')
# minimal build: only 'libffi' 'wayland' 'wayland-protocols' 'meson' 'ninja'
depends=('libffi' 'wayland' 'lz4' 'zstd' 'mesa')
optdepends=(
	'openssh: recommended transport'
	'ffmpeg: video compression'
	'systemtap: a makedepend, for tracing hooks'
)
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland-protocols' 'libdrm')
checkdepends=('weston' 'python-psutil')
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
source=('git+https://gitlab.freedesktop.org/mstoeckl/waypipe.git')
sha512sums=('SKIP')
options=(debug !strip)
arch=('any')

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
