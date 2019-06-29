# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>

_pkgname=librtcdcpp
pkgname="$_pkgname-git"
pkgver=r63.49ddb94
pkgrel=1
pkgdesc="A simple WebRTC DataChannels library"
arch=('i686' 'x86_64' 'any')
url="https://github.com/chadnickbok/librtcdcpp"
license=('BSD')
depends=('libnice' 'libusrsctp' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/chadnickbok/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	rm -rf build
	mkdir build
	cd build
	cmake -DDISABLE_SPDLOG=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
	cd "$_pkgname"
	install -m755 -d "$pkgdir"/usr/include/rtcdcpp
	install -m644 include/rtcdcpp/*.hpp "$pkgdir"/usr/include/rtcdcpp
	install -m755 -d "$pkgdir"/usr/lib
	install -m755 build/librtcdcpp.so "$pkgdir"/usr/lib
}
