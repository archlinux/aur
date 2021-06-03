# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=pplatex
pkgver=1.0
_pkgrc=rc3
pkgrel=1
epoch=
pkgdesc="A tool to reformat the output of latex and friends into readable messages."
arch=('x86_64')
url="https://github.com/stefanhepp/pplatex"
license=('GPL3')
groups=()
depends=('pcre')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver-$_pkgrc.tar.gz")
noextract=()
sha256sums=('83376ca3a92a21cf002ba1e5c7c09686d4c0c83c5af93d0118c4270437945dc7')

prepare() {
	cp -rf "$pkgname-$pkgname-$pkgver-$_pkgrc" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	mkdir -p build

	local CMAKE_VERSION="$(LC_ALL=C cmake --version | awk '{print $3; exit}')"

	# Needed for the link time optimization
	sed "s/\(cmake_minimum_required(\).*)/\1VERSION $CMAKE_VERSION)/" \
		-i CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 build/src/pplatex "$pkgdir/usr/bin/pplatex"
	ln -s pplatex "$pkgdir/usr/bin/ppdflatex"
	install -Dm755 src/ppluatex "$pkgdir/usr/bin/ppluatex"
}
