# Maintainer: Ben Brown <ben at demerara dot io>
# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: Moritz Poldrack <moritz at poldrack dot dev>
# Contributor: dnkl

_pkgname=yambar
pkgname="${_pkgname}-git"
pkgver=1.6.1.r60.g18a0920
pkgrel=1
pkgdesc='Modular status panel for X11 and Wayland, inspired by polybar (source from git)'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/dnkl/yambar'
license=('MIT')
makedepends=(
  'git'
  'meson'
  'ninja'
  'scdoc'
  'tllist>=1.0.1'
  'wayland-protocols'
  'xorgproto')
depends=(
  'alsa-lib'
  'fcft>=3.0.0'
  'json-c'
  'libmpdclient'
  'libpulse'
  'libudev.so'
  'libxcb'
  'libyaml'
  'pipewire'
  'pixman'
  'wayland'
  'xcb-util'
  'xcb-util-cursor'
  'xcb-util-wm')
optdepends=('xcb-util-errors: better X error messages')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source=('git+https://codeberg.org/dnkl/yambar.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	meson setup --buildtype=release --prefix=/usr \
		--wrap-mode=nofallback \
		-Db_lto=true \
		-Dbackend-x11=enabled -Dbackend-wayland=enabled \
		build
	meson compile -C build
}


package() {
	cd "${_pkgname}"
	meson install -C build --destdir "${pkgdir}"
}
