# Maintainer: Jay Schmidek <jschmidek at gmail dot com>
# Maintainer: Paul-Louis Ageneau <paul-louis at ageneau dot org>

pkgname=libdatachannel
pkgver=0.14.0
pkgrel=1
pkgdesc="C/C++ WebRTC Data Channels and Media Transport lightweight library"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('LGPL')
makedepends=('git' 'cmake')
depends=('openssl' 'libjuice' 'libsrtp')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
    cd $pkgname
    git submodule update --init --recursive "$srcdir"/"$pkgname"/deps/{libsrtp,usrsctp,plog}
}

build() {
    cd $pkgname
    rm -rf build
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_GNUTLS=0 -DUSE_NICE=0 -DUSE_SYSTEM_JUICE=1 -DUSE_SYSTEM_SRTP=1 -DNO_TESTS=1 -DNO_EXAMPLES=1
    cd build
    make
}

package() {
    cd $pkgname
    cd build
    make DESTDIR="$pkgdir/" install
}

