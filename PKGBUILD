# Maintainer: Piper Kai <zachybear58@gmail.com>

_pkgname="reproc"
pkgname="$_pkgname-git"
pkgver=14.2.4.r8.g9f39967
pkgrel=1
pkgdesc='Cross-platform library that simplifies working with external CLI applications from C and C++'
arch=('x86_64')
url='https://github.com/DaanDeMeyer/reproc'
license=('MIT')
makedepends=('git' 'cmake' 'gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=(${provides[@]})
# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake \
		-S "$_pkgname" \
		-B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_SHARED_LIBS=ON \
		-DREPROC++=ON \
		-DREPROC_TEST=ON \
		../
	cmake --build build
}

check() {
	cmake --build build --target test
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -D --mode=644 "$srcdir/$_pkgname"/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
