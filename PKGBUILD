# Maintainer: éclairevoyant

_pkgname=igt-gpu-tools
pkgname=intel-gpu-tools-git
pkgver=1.27.1.r34.31b6af91
pkgrel=1
pkgdesc="Tools for development and testing of the Intel DRM driver"
arch=(x86_64)
license=(MIT)
url="https://gitlab.freedesktop.org/drm/$_pkgname"
depends=(libdrm libpciaccess cairo python xorg-xrandr procps-ng kmod libxv libunwind peg systemd)
makedepends=('git' swig gtk-doc xorg-util-macros xorgproto meson)
provides=('intel-gpu-tools')
conflicts=('intel-gpu-tools')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	meson ../$_pkgname \
		--prefix=/usr \
		--libexecdir=/usr/lib
	ninja
}

check() {
	cd build
	ninja test
}

package() {
	cd build
	DESTDIR="$pkgdir" ninja install

	install -Dm644 ../$_pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
