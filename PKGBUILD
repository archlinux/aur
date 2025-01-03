# Maintainer: Chip Collier <photex@gmail.com>

# Based on `PKGBUILD` for package `sdbus-cpp0`, version 0.8.3-1, by Dan Johansen, Caleb Maclennan, Cirk2.

_pkgbase=sdbus-cpp
pkgname=sdbus-cpp1
pkgver=1.6.0
pkgrel=1
pkgdesc='a high-level C++ D-Bus library designed to provide expressive, easy-to-use API - Version 1'
url="https://github.com/Kistler-Group/$_pkgbase"
arch=(x86_64)
license=(LGPL2.1 'custom:sdbus-c++ LGPL Exception 1.0')
depends=(expat
         systemd-libs)
makedepends=(cmake
             doxygen
             systemd)
provides=(libsdbus-c++.so.1)
_archive="$_pkgbase-$pkgver"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ec8a2565bfc8f975c7ee528cb292021063ed793d6864c1c8733ca10ff906164')

build() {
	cmake -B build -S "$_archive" \
		-D CMAKE_INSTALL_PREFIX=/ \
		-D CMAKE_BUILD_TYPE=Release \
		-D BUILD_CODE_GEN=ON \
		-D BUILD_DOXYGEN_DOC=ON
	cmake --build build

	# Install so we can split the packaging up later
	DESTDIR="fakeinstall" cmake --install build
}

package_sdbus-cpp1() {
	for dir in lib include bin; do
		_package_dir $dir
	done
	# Remove files that would overwrite or conflict with the default sdbus-c++ package as this package is only for compatibility.
	rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{cmake,pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_archive/COPYING"*
}

_package_dir() {
	install -dm755 "$pkgdir/usr/$1"
	cp -dr --no-preserve=owner "$srcdir/fakeinstall/usr/$1/"* "$pkgdir/usr/$1"
}
