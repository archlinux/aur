# Maintainer: Saleem Rashid <trezor@saleemrashid.com>
_pkgname=trezord
pkgname="${_pkgname}-git"
gitname="${_pkgname}"
pkgrel=1
pkgver=1.2.1.r12.g751dcb4
pkgdesc='TREZOR Communication Daemon'
url='https://trezor.io/'
arch=('i686' 'x86_64')
license=('LGPL3')
provides=("${_pkgname}" 'trezor-bridge')
conflicts=("${_pkgname}" 'trezor-bridge-bin')
makedepends=('boost' 'cmake' 'git')
depends=('boost-libs' 'jsoncpp' 'libmicrohttpd' 'libusb' 'protobuf')
source=(
    "git://github.com/trezor/${gitname}.git"
    'git://github.com/trezor/trezor-crypto.git'
    'git://github.com/trezor/trezor-common.git'
    "${_pkgname}.sysusers"
    "${_pkgname}.patch"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'a4106f04d8322836905c6d300c0fb54849063bbc258ef76e28acdbec7c1c4df4'
    'f5930369c6cac75211092e065868781cc0eb5141b282c38c3973c7f73970de5c'
)

prepare() {
    cd "${srcdir}/${gitname}"
    git submodule init 'vendor/trezor-crypto'
    git config submodule.'vendor/trezor-crypto'.url "${srcdir}/trezor-crypto"
    git submodule update

    git apply "${srcdir}/${_pkgname}.patch"

    # Generate Protocol Buffers
    cd "${srcdir}/trezor-common/protob"
    protoc --cpp_out="${srcdir}/${gitname}/src/config" config.proto
}

pkgver() {
    cd "${srcdir}/${gitname}"
    git describe --tags --long | sed \
        -e 's/^v//' \
        -e 's/\([^-]*-g\)/r\1/;s/-/./g'
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
