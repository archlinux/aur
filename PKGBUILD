# Maintainer: Andrey Antufyev <andrey.antufyev@yandex.ru>
_libcaptver=1.0.0
_libcapturl='https://github.com/darkvision77/libcapt'
pkgname=captppd
pkgver=1.0.0
pkgrel=1
pkgdesc='CUPS driver for Canon CAPT v1 printers'
arch=(x86_64 i686 pentium4 armv7h aarch64 riscv64)
url='https://github.com/darkvision77/captppd'
license=(BSD-2-Clause)
depends=(glibc gcc-libs cups libusb)
makedepends=(cmake python)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"libcapt-$_libcaptver.tar.gz::$_libcapturl/archive/refs/tags/v$_libcaptver.tar.gz"
)
sha256sums=(
	'eca98b65093741db8748bf1a1081c56c0b65cee284d40dfa6a2033b941370b4a'
	'819a4dfba84a9ade482b0dedae74ac4e1114d244ce8adadab1ef1b57974269bd'
)

build() {
	local cmake_options=(
		-B build
		-S "$pkgname-$pkgver"
		-Wno-dev
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_CXX_FLAGS=-DNDEBUG
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON
		-DFETCHCONTENT_SOURCE_DIR_LIBCAPT="libcapt-$_libcaptver"
		-DBUILD_SHARED_LIBS=OFF
		-DBUILD_STATIC_LIBS=ON
	)
	cmake "${cmake_options[@]}"
	cmake --build build -v
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -m644 -D "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
