# Maintainer: FloofyPlasma <aur@floofyplasma.com>
# Contributor: Julia DeMille <me@jdemille.com>
pkgname=libobjc2
pkgver=2.3
_majorver=${pkgver%%.*}
_commit=v2.3
pkgrel=3
pkgdesc="Objective-C runtime library intended for use with Clang."
arch=("x86_64" "i686" "aarch64")
url="https://github.com/gnustep/libobjc2"
license=("MIT")
depends=(gcc-libs glibc)
makedepends=(cmake clang git robin-map)
provides=()
conflicts=(libdispatch) # conflicts with libdispatch as the system version does not include INSTALL_PRIVATE_HEADERS=ON in its CMake build
source=(
    "$pkgname::git+${url}.git#commit=${_commit}"
    "fix-libobjc-pc.patch"
)
b2sums=('d6b4088169ebc29c5bbf1513f93824369c8ac4acc2fbc13a9bbf1c08d5c83856535aeeb229c2626d15cfc4fc0c5bfbdc18a79fac1b95be5c21ba9c3d85df1f71'
        '86619fd413c1a84b52b2daee8d59ca6028be8ecc82033781616355c21a017c92b9d7fd4f11065859c69a033309bbcda2128f761e276cc963f84933c434ad6075')

prepare() {
    patch -d "$pkgname" -Np1 -i ../fix-libobjc-pc.patch
}

build() {
    cmake -B build -S "$pkgname" -G"Unix Makefiles" \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_OBJC_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_OBJCXX_COMPILER=clang++ \
        -DTESTS=OFF \
        -DLIBOBJC_NAME=objc2
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
