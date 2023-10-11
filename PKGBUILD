# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Cirk2 <privat+aur at cirk2 dot de>

_pkgbase=sdbus-cpp
pkgname=sdbus-cpp0
pkgver=0.8.3
pkgrel=1
pkgdesc='a high-level C++ D-Bus library designed to provide expressive, easy-to-use API - Version 0'
url="https://github.com/Kistler-Group/$_pkgbase"
arch=(x86_64)
license=(LGPL2.1 'custom:sdbus-c++ LGPL Exception 1.0')
depends=(expat
         systemd-libs)
makedepends=(cmake
             doxygen
             systemd)
provides=(libsdbus-c++0.so.0.8.3)
_archive="$_pkgbase-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0fd575ae0f463773dd9141242d1133731e2b780fd6526650ce992ba711d88628')

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

package_sdbus-cpp0() {
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_archive/COPYING"*
	for dir in lib include bin; do
		_package_dir $dir
	done
}

_package_dir() {
	install -dm755 "$pkgdir/usr/$1"
	cp -dr --no-preserve=owner "$srcdir/fakeinstall/usr/$1/"* "$pkgdir/usr/$1"
}
