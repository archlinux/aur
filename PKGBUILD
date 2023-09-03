# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Jay Schmidek <jschmidek at gmail dot com>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>

_pkgname=libdatachannel
pkgname="$_pkgname-nice"
pkgver=0.18.6
pkgrel=1
pkgdesc="C/C++ WebRTC network library featuring Data Channels, Media Transport, and WebSockets"
arch=('x86_64' 'aarch64')
url="https://github.com/paullouisageneau/$_pkgname"
license=('MPL2')
makedepends=('git' 'cmake' 'plog')
depends=('glibc' 'glib2' 'gcc-libs' 'openssl' 'libnice' 'libsrtp' 'libusrsctp')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('debug')
source=("git+https://github.com/paullouisageneau/$_pkgname.git#tag=v$pkgver")
md5sums=('SKIP')

prepare()
{
    cd $_pkgname
    # Added USE_SYSTEM_JSON cmake option
    git cherry-pick -n 2dc3d77e073b94cba4140a249723a28ef69bf27c
    # Added USE_SYSTEM_PLOG cmake option 
    git cherry-pick -n a74a02144a9618549909864aa1db00298317f42b
    # Added USE_SYSTEM_USRSCTP cmake option
    git cherry-pick -n b6d2e92231fcac13068eaa579c6d31db1b28ba51
    # Added PREFER_SYSTEM_LIB cmake option 
    git cherry-pick -n 286e58f489f7d036ffdd934528127505f66e89f7

    # Fix missing stdexcept header
    git cherry-pick -n 9f607201fe73937364a23e57daac1054231a6749
}

build() {
    cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DPREFER_SYSTEM_LIB=ON \
        -DUSE_NICE=ON \
        -DNO_TESTS=ON \
        -DNO_EXAMPLES=ON \
        -Wno-dev

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

