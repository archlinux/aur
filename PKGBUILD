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
  'libxcb' 'xcb-util' 'xcb-util-cursor' 'xcb-util-wm'
  'wayland'
  'pixman'
  'libyaml'
  'alsa-lib'
  'libudev.so'
  'json-c'
  'libmpdclient'
  'fcft>=3.0.0')
optdepends=('xcb-util-errors: better X error messages')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source=('git+https://codeberg.org/dnkl/yambar.git')
sha256sums=('SKIP')

pkgver() {
	cd yambar
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mkdir yambar/_build
	cd yambar/_build

	meson setup --buildtype=release --prefix=/usr \
		--wrap-mode=nofallback \
		-Db_lto=true \
		-Dbackend-x11=enabled -Dbackend-wayland=enabled \
		../
	ninja
}


package() {
	cd "${srcdir}/yambar/_build"
	DESTDIR="${pkgdir}/" ninja install
}
