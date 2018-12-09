# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=entt
pkgbase=entt
pkgver=2.7.3
pkgrel=1
epoch=
pkgdesc="A header-only, tiny and easy to use entity-component system (and much more) written in modern C++"
arch=('any')
url="https://skypjack.github.io/entt/"
license=('MIT')
groups=()
makedepends=(cmake)
checkdepends=()
optdepends=()
conflicts=()
backup=()
options=()
install=
changelog=

source=("https://github.com/skypjack/entt/archive/v$pkgver.tar.gz"
        "https://github.com/skypjack/entt/commit/7c5019c30fc463c13c8a20f54c894aac908ebd56.patch")
noextract=()
sha256sums=('81227bc7170d6d03371059f0a5167e706831459b72bbc35022fe87cb36854faa'
            '7f29e54eb89343dce32a7c929a57501f55d4a01456d8aaf2a74c53f05de10406')
validpgpkeys=()

prepare() {
	patch -d $pkgname-$pkgver -p1 < 7c5019c30fc463c13c8a20f54c894aac908ebd56.patch
}

# pkgver() {
# 	cd "$_pkgname"
# 
# 	(
# 		set -o pipefail
# 		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
# 		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# 	)
# }

build() {
	mkdir -p build
	cd build

	cmake ../$pkgname-$pkgver -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_LIBCPP=OFF -DBUILD_TESTING=OFF -DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {

	pushd build
	DESTDIR="$pkgdir"/ make install
	popd > /dev/null

	mkdir -p "$pkgdir"/usr/share/licenses/$pkgbase
	install $pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgbase/
}
