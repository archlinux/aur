# Maintainer: Saleem Rashid <spudowiar@outlook.com>
_pkgname=trezord
pkgname="${_pkgname}-git"
gitname="${_pkgname}"
pkgrel=1
pkgver=1.2.0.r259.ab3b262
pkgdesc='TREZOR Communication Daemon'
url='http://bitcointrezor.com/'
arch=('i686' 'x86_64')
license=('LGPL3')
provides=("${_pkgname}" 'trezor-bridge')
conflicts=("${_pkgname}" 'trezor-bridge-bin')
makedepends=('git' 'cmake' 'boost')
depends=('boost-libs' 'protobuf' 'libmicrohttpd' 'jsoncpp' 'libusb')
install="${_pkgname}.install"
source=(
    "git://github.com/trezor/${gitname}.git"
    "git://github.com/trezor/trezor-crypto.git"
    "${_pkgname}.sysusers"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "${gitname}"
    git submodule init vendor/trezor-crypto
    git config submodule.vendor/trezor-crypto.url "${srcdir}/trezor-crypto"
    git submodule update

    # disable static linking
    cd "${srcdir}/${gitname}"
    sed -i '/if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")/,/endif(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")/d' CMakeLists.txt
    sed -i 's/NAMES json$/&cpp/' cmake/modules/Findjsoncpp.cmake
}

pkgver() {
    cd "${srcdir}/${gitname}"
    printf "%s.r%s.%s" "$(< VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${gitname}"
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "${srcdir}/${gitname}/build"

    install -Dm0755 trezord "${pkgdir}/usr/bin/trezord"

    install -Dm0644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"

    install -Dm0644 ../release/linux/trezor.rules    "${pkgdir}/usr/lib/udev/rules.d/51-trezor.rules"
    install -Dm0644 ../release/linux/trezord.service "${pkgdir}/usr/lib/systemd/system/trezord.service"
}
