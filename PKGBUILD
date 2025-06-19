# Maintainer: littleblack111 <littleblack11111@gmail.com>

_pkgname="libsock"
pkgname="$_pkgname-git"
pkgver=r18.6c75a10
pkgrel=1
pkgdesc="Minimal C++ socket library"
arch=('x86_64' 'aarch64')
url="https://github.com/littleblack111/libsock"
license=('BSD-3-Clause')
options=('!debug')

depends=(
	glibc
	gcc-libs
)

makedepends=(
	cmake
	git
)

_v=${pkgver#r}
provides=("$_pkgname=${_v%%.*}" "$_pkgname.so")
conflicts=("$_pkgname")

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgsrc" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	local cmake_options=(
		-B build
		-S "$_pkgsrc"
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
