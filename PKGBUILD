# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=libaperture-libcamera-git
pkgver=r122.c66e4ed
pkgrel=1
pkgdesc='A camera library for GTK3 with libcamera patches from mobian'
arch=('x86_64' 'aarch64')
url="https://salsa.debian.org/Mobian-team/packages/libaperture-0/-/tree/mobian/"
license=('LGPL')
depends=('gtk3' 'vala' 'gobject-introspection' 'gst-plugin-gtk')
makedepends=('git' 'meson' 'quilt' 'cmake')
checkdepends=()
optdepends=()
provides=('libaperture')
conflicts=('libaperture')
replaces=('libaperture')
source=(libaperture-libcamera-git::git+https://salsa.debian.org/Mobian-team/packages/libaperture-0.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	# Install patches from debian/patches/series
	QUILT_PATCHES='debian/patches' quilt push -a
}

build() {
	arch-meson ${pkgname} build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

