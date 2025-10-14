# Maintainer: Eike <e.g@wwu.de>
pkgname=openeb-git
_pkgname=openeb
pkgdesc="Open source SDK for event based cameras by Prophesee"
pkgver=r153.0499c95
pkgrel=1
arch=('any')
license=(custom)
url="https://github.com/prophesee-ai/openeb"
depends=(opencv boost eigen libusb glew glfw hdf5 ffmpeg openscenegraph libcanberra)
optdepends=('cuda: machine learning samples')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/prophesee-ai/openeb" includes.patch)
sha256sums=('SKIP'
            '3482f105c35382f30358a174300f653c42337f97af8db95560e46b09d441e942')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

prepare() {
	patch -d "${_pkgname}" -Np 1 -i ../includes.patch
}
