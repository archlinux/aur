# Maintainer: Jay Schmidek <jschmidek at gmail dot com>
# Maintainer: Paul-Louis Ageneau <paul-louis at ageneau dot org>

pkgname=libdatachannel
pkgver=v0.13.5
pkgrel=1
pkgdesc="C/C++ WebRTC Data Channels and Media Transport lightweight library"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('LGPL')
makedepends=('git' 'cmake')
depends=('openssl' 'libsrtp')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive "$srcdir"/"$pkgname"/deps/{libsrtp,usrsctp,plog,libjuice}
}

build() {
    cd "$pkgname"
    rm -rf build
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_NICE=0 -DUSE_GNUTLS=0 -DUSE_SYSTEM_SRTP=1 -DNO_TESTS=1 -DNO_EXAMPLES=1
    cd build
    make
}

package() {
    cd "$pkgname"
    install -m755 -d "$pkgdir"/usr/include/rtc
    install -m644 include/rtc/*.{hpp,h} "$pkgdir"/usr/include/rtc
    install -m755 -d "$pkgdir"/usr/lib
    install -m755 build/"$pkgname".so "$pkgdir"/usr/lib
}

