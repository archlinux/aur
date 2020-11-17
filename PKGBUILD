# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=yambar
pkgver=1.5.0
pkgrel=1
pkgdesc='Modular status panel for X11 and Wayland, inspired by polybar'
arch=('x86_64')
url='https://codeberg.org/dnkl/yambar'
license=('MIT')
depends=(
	'xcb-util-cursor'
)
makedepends=(
	'ninja'
	'meson'
	'cmake'
)
provides=('yambar')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/dnkl/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('eed0ff5c884d8019116549e8305c3ed1')

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
meson --buildtype=release --prefix=${pkgdir}/usr/local/ ../..
}

build() {
	cd "${srcdir}/yambar/bld/release"
	ninja
}

package() {
	cd "${srcdir}/yambar/bld/release"
	ninja install
	
	mv "${pkgdir}/usr/local/share/man" "${pkgdir}/usr/local/man"
}
