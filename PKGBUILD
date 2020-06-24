# Maintainer: Julian Oes <julian at oes dot ch>
pkgname=mavsdk
pkgver=0.28.0
pkgrel=1
epoch=
pkgdesc="API and library for MAVLink compatible systems written in C++11"
arch=('i686' 'x86_64')
url="https://mavsdk.mavlink.io"
license=('BSD-3-Clause')
groups=()
depends=('curl' 'jsoncpp' 'tinyxml2' 'zlib')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/mavlink/mavsdk.git#tag=v$pkgver"
        "git://github.com/mavlink/mavsdk-proto.git"
        "git://github.com/google/googletest.git"
        "git://github.com/mavlink/c_library_v2.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname"
    git submodule init
    git config submodule.proto.url $srcdir/mavsdk-proto
    git config submodule.src/third_party/gtest.url $srcdir/googletest
    git config submodule.src/third_party/mavlink/include/mavlink/v2.0.url $srcdir/c_library_v2
    git submodule update
}

build() {
	cd "$pkgname"
    cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DSUPERBUILD=OFF -DBUILD_BACKEND=OFF -Bbuild -S.
    cmake  --build build
}

check() {
	cd "$pkgname"
    build/src/unit_tests_runner
}

package() {
	cd "$pkgname"
    cmake --install build
}
