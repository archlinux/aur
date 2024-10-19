pkgname=libdfx
pkgver=2024.1
pkgrel=1
pkgdesc="a lightweight user-space library that provides APIs for application to configure the PL"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Xilinx/$pkgname
license=(custom)
depends=(libdrm)
makedepends=(cmake ninja)
source=("$url/archive/xilinx_v$pkgver.tar.gz")
sha256sums=('742069dd258cee239030eb2cfe400bdfda9f17cd49574642b04533430761d9c0')

prepare() {
	cd "$pkgname-xilinx_v$pkgver" || return 1
  
	sed -i s=drm/=libdrm/=g src/libdfx.c
	cmake -GNinja -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	sed -i '$ainstall(TARGETS dfx_app RUNTIME)' apps/CMakeLists.txt
}

build() {
	cd "$pkgname-xilinx_v$pkgver" || return 1

	cmake --build build
}

package() {
	cd "$pkgname-xilinx_v$pkgver" || return 1

	DESTDIR="$pkgdir" cmake --install build
}
