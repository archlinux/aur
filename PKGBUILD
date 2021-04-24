# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
_pkgname=libsigmf
pkgname=$_pkgname-git
pkgver=r13.8ac7dbc
pkgrel=1
pkgdesc="A header-only C++ library for working with SigMF metadata"
arch=(any)
url="https://github.com/deepsig/libsigmf"
license=('Apache')
depends=()
makedepends=('cmake' 'git' 'flatbuffers' 'nlohmann-json')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git"
        "0001-cmake-fix-installation-of-fbs-files.patch"
)
sha256sums=('SKIP'
            '03012d41f55c1a2f7a61f952c79d14e80bba1f2ee508d77a3d94fe78f3ab394c')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	patch -p1 < "$srcdir/0001-cmake-fix-installation-of-fbs-files.patch"
}

build() {
	cmake -B build -S "$_pkgname" \
		-Wno-dev \
		-DCMAKE_BUILD_TYPE='None' \
		-DUSE_SYSTEM_FLATBUFFERS=ON \
		-DUSE_SYSTEM_JSON=ON \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
