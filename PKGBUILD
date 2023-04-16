# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=lgx2userspace
pkgname=$_pkgname-git
pkgver=0.3.0.78e7ffe
pkgrel=1
pkgdesc="This is a Linux userspace driver for the AverMedia LGX2 (GC551) and AverMedia LGX (GC550). Using the noconan branch."
arch=('any')
url="https://github.com/ChrisAJS/lgx2userspace"
license=('custom:MIT')
groups=()
depends=('libao' 'libusb' 'sdl2' 'sdl2_gfx' 'v4l2loopback-dkms' 'v4l2loopback-utils')
makedepends=('cmake')
install=lgx2userspace.install
source=("${_pkgname}::git+https://github.com/ChrisAJS/lgx2userspace.git#branch=noconan" "dependencies.cmake.patch")
md5sums=('SKIP')

prepare() {
	mkdir -p "${_pkgname}/build"
	cd $_pkgname
  patch --forward --strip=1 --input="${srcdir}/dependencies.cmake.patch"
}

build() {
	cd "${_pkgname}/build"
	cmake .. -DENABLE_LGX_GC550_SUPPORT=ON -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${_pkgname}"
	install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/etc/udev/rules.d"
	cp 999-avermedia.rules "$pkgdir/etc/udev/rules.d/"

	cd "build/src/cli"
	mkdir -p "$pkgdir/usr/bin"
	cp lgx2userspace "$pkgdir/usr/bin/"
}
md5sums=('SKIP'
         'fa638f9c72e790ba4b0acd96d92ded57')
md5sums=('SKIP'
         'fa638f9c72e790ba4b0acd96d92ded57')
