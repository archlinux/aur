# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=yambar
pkgver=1.8.0
pkgrel=1
pkgdesc='Modular status panel for X11 and Wayland, inspired by polybar'
arch=('x86_64')
url='https://codeberg.org/dnkl/yambar'
license=('MIT')
depends=(
	'alsa-lib'
	'libxcb'
	'xorgproto'
	'libyaml'
	'systemd'
	'fontconfig'
	wayland{,-protocols}
	xcb-util{,-cursor,-errors,-wm}
	'pixman'
)
optdepends=(
	'libmpdclient: mpd module'
)
makedepends=(
	'git'
	'meson'
	'scdoc'
)
provides=('yambar')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/dnkl/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('51127d20613666b9924deb9afd92c48d69815c5043d2996b3f0f6e9705fcabc8')

prepare() {
	cd yambar

	pushd subprojects
	git clone https://codeberg.org/dnkl/tllist.git
	git clone https://codeberg.org/dnkl/fcft.git
	popd

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
