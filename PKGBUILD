# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=yambar
pkgver=1.6.1
pkgrel=1
pkgdesc='Modular status panel for X11 and Wayland, inspired by polybar'
arch=('x86_64')
url='https://codeberg.org/dnkl/yambar'
license=('MIT')
depends=(
	'xcb-util-cursor'
)
makedepends=(
	'cmake'
	'libmpdclient'
	'libyaml'
	'meson'
	'ninja'
	'scdoc'
)
provides=('yambar')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/dnkl/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9ddf0bd7a708445697b4bf2f1d6d0fe5c29c5c7cd6df6058a739fe89413bd2c7')

prepare() {
	rm -rf "${srcdir}"
	mkdir -p "${srcdir}"
	bsdtar -xf "../${pkgname}-${pkgver}.tar.gz" -C "${srcdir}"

	cd yambar

	mkdir subprojects
	pushd subprojects
	git clone https://codeberg.org/dnkl/tllist.git
	git clone https://codeberg.org/dnkl/fcft.git
	popd

#	sed -ie 's/false/true/' meson_options.txt

	mkdir -p bld/release && cd bld/release
	meson --buildtype=release --prefix=${pkgdir}/usr/ ../..
}

build() {
	cd "${srcdir}/yambar/bld/release"
	ninja
}

package() {
	cd "${srcdir}/yambar/bld/release"
	ninja install
}
