# Maintainer: Krzysiu <KrzysiuN@proton.me>
pkgname=hfsutils-git
pkgver=r30.7c696d3
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="https://github.com/GramNaTosterze/hfs"
license=(APPLE)
#groups=()
depends=(git libdispatch libbsd)
makedepends=(cmake clang)
provides=("${pkgname}")
conflicts=("${pkgname}")
#replaces=()
#backup=()
#options=()
#install=
source=("$pkgname::git+https://github.com/GramNaTosterze/hfs")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
  	( set -o pipefail
    		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  	)
}

#prepare() {

#}

build() {
	cmake -B build -S "$pkgname" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX=/usr \
  		-DCMAKE_C_COMPILER=clang \
    		-DCMAKE_CXX_COMPILER=clang++ \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

