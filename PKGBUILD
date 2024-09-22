# Contributor: TwoFinger
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tom <reztho@archlinux.org>
# Contributor: bitwave

pkgname=textadept
_basename=textadept
pkgver=12.4
pkgrel=3
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
depends=(qt6-base qt6-5compat ncurses)
makedepends=(wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz"
		0001_fix-build.diff)
sha256sums=('74e480e07fd559103ec3171a754df5d1879322baf395107ad705f97a1583bbf0'
            'a6e19e16eddfe0c2c88734b2d2daa321b7c1dfde18aaae30376ea7b4219acb18')


prepare() {
	cd "${_basename}-${_basename}_$pkgver"
	# fix https://github.com/orbitalquark/textadept/issues/571
	# not using the commit, as the CMakeLists structure changed vastly since 12.4
	patch -Np1 -i "${srcdir}"/0001_fix-build.diff
}
build() {
	cd "${_basename}-${_basename}_$pkgver"
	export LDFLAGS=-Wl,-z,relro,-z,now
	cmake -B build_dir \
		-D CMAKE_INSTALL_PREFIX="$pkgdir"/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D GTK2=OFF -D GTK3=OFF
	cmake --build build_dir -j
}

package() {
	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
