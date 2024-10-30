# Maintainer: piernov <piernov@piernov.org>

pkgname=openeb3
_pkgname=openeb
pkgdesc="Open source SDK for event based cameras by Prophesee with support for EVK1"
pkgver=3.1.2
pkgrel=1
arch=('any')
license=(custom)
url="https://github.com/prophesee-ai/openeb"
depends=(opencv boost eigen libusb glew glfw hdf5 ffmpeg openscenegraph libcanberra)
optdepends=('cuda: machine learning samples')
makedepends=('git')
conflicts=('openeb-git')
provides=('openeb')
source=("${_pkgname}::git+https://github.com/prophesee-ai/openeb#tag=${pkgver}"
  "fix-build.patch"
  "python-version.patch")
sha256sums=('2f977d673ae345747d04cd224f8263e6b7f1cde58d46aa43a1bf0425fa548ab7'
            'c6c341a17aab158179d741720fe7b175a9991514ac5d9030ea4b2f1344de55c4'
            'bf2109e7df3e9d77735458d991b27a89fc99d7fae9721c1cffe6330c48045acc')

prepare() {
	cd "${_pkgname}"
  patch -p1 -i "${srcdir}/fix-build.patch"
  patch -p1 -i "${srcdir}/python-version.patch"
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
