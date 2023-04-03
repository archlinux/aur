# Maintainer: Eike <e.g@wwu.de>
pkgname=openeb-git
_pkgname=openeb
pkgdesc="Open source SDK for event based cameras by Prophesee"
pkgver=r90.ea2cf58
pkgrel=1
arch=('any')
license=(custom)
url="https://github.com/prophesee-ai/openeb"
depends=(opencv boost eigen libusb glew glfw hdf5 ffmpeg openscenegraph cuda libcanberra)
makedepends=('git')
source=("${_pkgname}::git+https://github.com/prophesee-ai/openeb" cuda.patch)
sha256sums=('SKIP' f0cc6beff220d69e629d01ab84923cb3abc895a4df716dd0a9a07a1c140800bc)

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	patch --forward --strip=1 --input="${srcdir}/cuda.patch"
}

build() {
    cmake -B build -S "${_pkgname}" \
		-DBUILD_TESTING=off \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
