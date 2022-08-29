# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
pkgname=waypipe-git
pkgver=0.8.3.r0.gf37c6658
pkgrel=1
pkgdesc='A proxy for Wayland protocol applications; like ssh -X'
license=('MIT')
# minimal build: only 'meson' 'ninja' + C compiler/libc
makedepends=('git' 'meson' 'ninja' 'scdoc' 'libdrm' 'pkgconf' 'cmake')
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
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
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
