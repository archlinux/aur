# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Weitian Leung <weitianleung[at]gmail[dot]com>

_pkgname=pywpsrpc
pkgname="python-${_pkgname}"
pkgver=2.4.0
pkgrel=1
# Pinned wpsrpc-sdk submodule commit (upstream tag v2.4.0 records it).
# It carries the WPS RPC headers plus the reference librpc*api_wpsqt.so files
# that are used for linking when no system WPS Office is installed.
_sdkcommit=4c24464a9c0189443108be0996ee1cc4ad6545dd
pkgdesc="Python bindings for WPS Office RPC (Linux only)"
arch=('x86_64')
url="https://github.com/timxx/${_pkgname}"
license=('MIT')
depends=('python' 'qt5-base' 'wps-office')
makedepends=('sip' 'qt5-base')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/timxx/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "wpsrpc-sdk-${_sdkcommit}.tar.gz::https://github.com/timxx/wpsrpc-sdk/archive/${_sdkcommit}.tar.gz"
        "sip-abi-version.patch")
sha256sums=('61ae3febdc171b937013de5fba2487bdcacd625634977272d077cd5f24b96cb1'
            '18051bb8be8d5d7d84f2da960a174b2cf2a18a00f9c5048cc49f1ce1b656d431'
            'c18d9398030df1c47f068a99371eb34c24c2012a95d78e75e401a519797542e8')

prepare() {
    cd "${_pkgname}-${pkgver}"
    # archive tarballs only contain an empty submodule directory
    rm -rf wpsrpc-sdk
    mv "${srcdir}/wpsrpc-sdk-${_sdkcommit}" wpsrpc-sdk

    # project.py still assumes sip < 6.17, where the ABI version was a string
    # and copy_nonshared_sources() had no module configuration argument
    patch -Np1 -i "${srcdir}/sip-abi-version.patch"
}

build() {
    cd "${_pkgname}-${pkgver}"
    sip-build --verbose
}

package() {
    cd "${_pkgname}-${pkgver}/build"
    # -j1: sip-distinfo hashes the installed .sip files, a parallel install
    # races with it and fails on the not-yet-copied ones
    make INSTALL_ROOT="${pkgdir}" -j1 install

    python -m compileall -q -d / "${pkgdir}/usr/lib"
    python -O -m compileall -q -d / "${pkgdir}/usr/lib"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
