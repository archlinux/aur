# Maintainer: Ash <xash at riseup d0t net>

pkgname=async-profiler-bin
_pkgname=async-profiler
pkgver=4.4
pkgrel=1
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/async-profiler/async-profiler'
license=('Apache')
depends=('java-environment')
provides=('async-profiler')
conflicts=('async-profiler')
options=('!strip')

source_x86_64=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/async-profiler-${pkgver}-linux-x64.tar.gz")
source_aarch64=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/async-profiler-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('1233f26fc95753e75ce32733bbcaf8f0bedc2c098b0e798af87935b08a63b24e')
sha256sums_aarch64=('86ff97b4436accdb6d7bb65c1cf6e38a756f2037a921994d8fa1dcb97d1dc53c')

package() {
    local _upstream_arch

    case "${CARCH}" in
        x86_64) _upstream_arch='x64' ;;
        aarch64) _upstream_arch='arm64' ;;
        *) printf 'Unsupported architecture: %s\n' "${CARCH}" >&2; return 1 ;;
    esac

    cd "${_pkgname}-${pkgver}-linux-${_upstream_arch}"

    # upstream layout
    install -d "${pkgdir}/opt/async-profiler"
    cp -a --no-preserve=ownership . "${pkgdir}/opt/async-profiler/"

    # binaries
    install -d "${pkgdir}/usr/bin"
    ln -sf /opt/async-profiler/bin/asprof "${pkgdir}/usr/bin/asprof"
    ln -sf /opt/async-profiler/bin/jfrconv "${pkgdir}/usr/bin/jfrconv"

    # shared library
    install -d "${pkgdir}/usr/lib"
    ln -sf /opt/async-profiler/lib/libasyncProfiler.so \
        "${pkgdir}/usr/lib/libasyncProfiler.so"

    # headers
    install -d "${pkgdir}/usr/include"
    ln -sf /opt/async-profiler/include/asprof.h \
        "${pkgdir}/usr/include/asprof.h"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
