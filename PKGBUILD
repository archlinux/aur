# Maintainer: alzpmq <kodatemitsuru@outlook.com>
_pkgname=Livox-SDK2
pkgname=livox-sdk2
pkgver=1.2.5
pkgrel=1
pkgdesc="Drivers for receiving LiDAR data and controlling lidar, support Lidar HAP and Mid-360."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Livox-SDK/Livox-SDK2"
license=('LicenseRef-Livox')
depends=("glibc"
         "gcc-libs")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Livox-SDK/Livox-SDK2/archive/refs/tags/v$pkgver.tar.gz"
        "fix_cmake_4.patch"
        "fix_gcc15.patch")
sha256sums=('38d65c969788285f298227fbd954eb253e2816e4a6a93a9bfc624cf91fb5e75a'
            'ec73de0f7abdffdcafdc145850078bcd5e2ff7921782688b29199cbe617357a3'
            'fe9eb9754b8f7336e5dad5d954aa8c110efb7c70b15539b8106bb9986c1a2c65')

prepare() {
        cd "$_pkgname-$pkgver"
        patch -p1 -i "$srcdir/fix_cmake_4.patch"
        patch -p1 -i "$srcdir/fix_gcc15.patch"
}

build() {
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build 
}

package() {
    cd build
    make DESTDIR="$pkgdir/" install
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
