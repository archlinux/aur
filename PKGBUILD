# Maintainer: w0rty <mawo97 at gmail.com>
# old maintainer: Dominik Heidler <dominik@heidler.eu>
pkgname=rtl_433-git
pkgver=r3635.b91e971a
pkgrel=1
pkgdesc="Program to decode radio transmissions from devices on the ISM bands (and other frequencies"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'armv6h')
license=('GPL-2.0-only')
depends=(rtl-sdr soapysdr glibc openssl libusb)
makedepends=(gcc cmake doxygen git)
optdepends=()
provides=('rtl_433')
conflicts=('rtl_433')
url="https://github.com/merbanan/rtl_433"
source=('git+https://github.com/merbanan/rtl_433.git')
md5sums=('SKIP')

_gitname=rtl_433

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$_gitname" \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	find "rtl_433/examples" -type f -exec \
    install -Dvm 644 -t "$pkgdir"/usr/share/doc/$pkgname {} +;
}
