# Maintainer: gaelic <gaelic@cargal.org>
pkgname=librevault-daemon-git
_pkgname=librevault
pkgver=0.1.19
pkgrel=1
pkgdesc="File synchronization designed with privacy in mind"
arch=(x86_64 i686)
url="https://librevault.com/"
license=('GPL')
groups=()
makedepends=('git' 'cmake' 'boost')
depends=('protobuf' 'boost-libs' 'crypto++')
provides=('librevault-daemon-git')
conflicts=('librevault', 'librefault-git')
replaces=()
backup=()
options=()
install=
source=(
	'librevault::git+https://github.com/Librevault/librevault.git'
)
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	mkdir -p build
	cd "$srcdir/${_pkgname}"
	git submodule update --init
}

build() {
	cd build
	cmake "$srcdir/${_pkgname}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_GUI=OFF \
		-DBUILD_CLI=OFF
	cmake --build .
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
