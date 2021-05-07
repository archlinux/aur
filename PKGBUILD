# Maintainer: PedroHLC <root@pedrohlc.com>
# Contributor: Moritz Poldrack <moritz at poldrack dot dev>

_pkgname=yambar
pkgname="${_pkgname}-git"
pkgver=1.6.1.r60.g18a0920
pkgrel=1
pkgdesc='Modular status panel for X11 and Wayland, inspired by polybar (source from git)'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/dnkl/yambar'
license=('MIT')
depends=(
	'xcb-util-cursor'
	'pixman' 
	'xcb-util-wm'
	'xorgproto'
	'wayland'{,-protocols} 
	'fontconfig' 
	'alsa-lib'
)
makedepends=(
	'git'
	'cmake'
	'libmpdclient'
	'libyaml'
	'meson'
	'ninja'
	'scdoc'
)
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source=(
	'git+https://codeberg.org/dnkl/yambar.git'
	'git+https://codeberg.org/dnkl/tllist.git'
	'git+https://codeberg.org/dnkl/fcft.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd yambar
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd yambar

	pushd subprojects
	ln -s ../../tllist ./
	ln -s ../../fcft ./
	popd

	mkdir -p bld/release && cd bld/release
	meson --buildtype=release --prefix="${pkgdir}/usr/" ../..
}

build() {
	cd yambar/bld/release
	ninja
}

package() {
	cd "${srcdir}/yambar/bld/release"
	ninja install
}
