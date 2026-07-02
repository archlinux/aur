# Contributor: TwoFinger

pkgname=textadept-gtk2
_basename=textadept
pkgver=13.0
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
depends=(gtk2 ncurses)
makedepends=(wget unzip cmake)
provides=($pkgname)
conflicts=(${_basename} ${_basename}-gtk3)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=('e9bb1f0c5839c58d44149601d4dac69a1599d1493add4a3d0c11a2113c398d34')

prepare() {
	cd "${_basename}-${_basename}_$pkgver"
	sed -i '/GTK REQUIRED/ {s/-2/-3/; s/-3/-2/}' CMakeLists.txt
}

build() {
	cd "${_basename}-${_basename}_$pkgver"
	export LDFLAGS=-Wl,-z,relro,-z,now
	cmake -B build_dir \
		-D CMAKE_INSTALL_PREFIX="$pkgdir"/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D QT=OFF
	cmake --build build_dir -j
}

package_textadept-gtk2() {
	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
