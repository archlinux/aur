# Maintainer: Jay Schmidek <jschmidek at gmail dot com>

pkgname="libdatachannel"
pkgver=v0.10.4
pkgrel=1
pkgdesc="C/C++ WebRTC Data Channels"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('LGPL')
makedepends=('git' 'cmake')
depends=('libnice' 'openssl')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git submodule update "$srcdir"/"$pkgname"/deps/{libsrtp,usrsctp,plog,libjuice}
}

build() {
	cd "$pkgname"
	rm -rf build
	cmake -B build -DUSE_NICE=1 -DUSE_GNUTLS=0 -DUSE_SYSTEM_SRTP=0 -DNO_TESTS=1 -DNO_EXAMPLES=1 -DDISABLE_SPDLOG=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cd build
    make
}

package() {
	cd "$pkgname"
	install -m755 -d "$pkgdir"/usr/include/"$pkgname"
	install -m644 include/rtc/*.{hpp,h} "$pkgdir"/usr/include/"$pkgname"
	install -m755 -d "$pkgdir"/usr/lib
	install -m755 build/"$pkgname".so "$pkgdir"/usr/lib
}