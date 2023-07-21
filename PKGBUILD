# Maintainer: Max Gautier <mg@max.gautier.name>
# Contributor: Eragon <eragon at eragon dot re>
# Contributor: Moritz Poldrack <moritz at poldrack dot dev>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: dnkl

pkgname=yambar-wayland
_pkgname=yambar
pkgver=1.10.0
pkgrel=5
pkgdesc="Simplistic and highly configurable status panel for Wayland (No X11 support)"
arch=('any')
url=https://codeberg.org/dnkl/$_pkgname
license=('MIT')
conflicts=('yambar')
provides=('yambar')
makedepends=(
    'git'
    'wayland-protocols'
	'meson'
	'ninja'
	'scdoc'
	'tllist')
depends=(
	'wayland'
	'pixman'
	'libyaml'
	'libudev.so'
	'libpulse'
	'pipewire'
	'fcft')
# FIXME : I can't test if theses are really optional - Eragon
optdepends=(
	'alsa-lib: for the ALSA module'
	'json-c: for the XKB module'
	'libmpdclient: for the MPD module')
checkdepends=(
	'libmpdclient')
source=("git+$url.git?signed#commit=c4e094de3e531675bae9ff76d7e6f0dfdcaecae9")
sha256sums=('SKIP')
validpgpkeys=('B19964FBBA09664CC81027ED5BBD4992C116573F') # Daniel Eklöf (Git signing) <daniel@ekloef.se>

build() {
	cd $_pkgname
	meson --buildtype=release \
		--prefix=/usr \
		--wrap-mode=nofallback \
		-Db_lto=true \
		-Dbackend-x11=disabled \
		-Dbackend-wayland=enabled \
		./build
	ninja -C build
}

check() {
	cd $_pkgname
	ninja -C build test
}

package() {
	cd $_pkgname
	DESTDIR="${pkgdir}/" ninja -C build install
}
