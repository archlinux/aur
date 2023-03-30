# Maintainer: Eike <e.g@wwu.de>
pkgname=openeb-git
_pkgname=openeb
pkgdesc="Open source SDK for event based cameras by Prophesee"
pkgver=r89.04022c2
pkgrel=1
arch=('any')
license=(custom)
url="https://github.com/prophesee-ai/openeb"
depends=(opencv boost eigen libusb glew glfw ffmpeg libcanberra)
makedepends=('git')
source=("${_pkgname}::git+https://github.com/prophesee-ai/openeb" "python-version.patch")
sha256sums=('SKIP' "a0a156d1f96bcfb100ff29c27fd0a1de9216da60302d77687ab1cdcdda9bfae7")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	patch --forward --strip=1 --input="${srcdir}/python-version.patch"
}

build() {
    cmake -B build -S "${_pkgname}" \
		-DBUILD_TESTING=off \
		-DBUILD_TESTING=off \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
