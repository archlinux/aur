# Maintainer: hazelnot
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=bsnes-hd
_gitver=beta_10_6
pkgver=beta_10_6.r0.gde27b9e
pkgrel=2
pkgdesc='Nintendo SNES emulator, featuring HD Mode 7 and Widescreen.'
arch=('x86_64')
url='https://github.com/DerKoun/bsnes-hd'
license=('GPL3')
depends=('alsa-lib' 'gtk2' 'libao' 'libpulse' 'libxext' 'libxv' 'openal' 'libudev.so' 'sdl2')
makedepends=('git')
conflicts=('bsnes' 'bsnes-classic-git' 'bsnes-plus-git' 'bsnes-qt5')
source=(
	"git+https://github.com/DerKoun/bsnes-hd.git"
	bsnes-hd.patch
)
sha512sums=(
	'SKIP'
	'01d88af9cf5e20b8f380d61c7290dd8b3423b4f0d66de9db42873fea66c7e261bef4a318a18d3f60c221abb00b9321affcef4b0195df090ec0f93eadd195af11'
)

pkgver() {
	cd "$srcdir/${pkgname}"

	git describe --long --tags | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname}"

	git checkout tags/"${_gitver}" -b "${_gitver}"
	# fix root issue in package
	patch -Np1 -i "$srcdir/bsnes-hd.patch"
}

build() {
	cd "$srcdir/${pkgname}/bsnes"

	make
}

package() {
	cd "$srcdir/${pkgname}/bsnes"

	make prefix="${pkgdir}/usr" install
}
