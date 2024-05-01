# Maintainer: TwoFinger

pkgname=textadept-gtk2
_basename=textadept
pkgver=12.4
pkgrel=1
pkgdesc="Fast, minimalist, and remarkably extensible cross-platform text editor"
arch=(i686 x86_64 aarch64)
url="https://github.com/orbitalquark/textadept"
license=(MIT)
makedepends=(gtk2 ncurses wget unzip cmake)
source=("$url/archive/${_basename}_$pkgver.tar.gz")
sha256sums=(a9c3952d4055007c3bc9c65d685adb5a8abdb589646623d7141fc709d86464c2)

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
	depends=(gtk2 ncurses)
	provides=($pkgname)
	conflicts=(${_basename} ${_basename}-gtk3)

	cd "${_basename}-${_basename}_$pkgver"
	cmake --install build_dir
}
