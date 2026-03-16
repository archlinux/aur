# Maintainer: eirikr <151315375+Oichkatzelesfrettschen@users.noreply.github.com>
# Why: AUR optix PKGBUILD requires a manual NVIDIA login download (no public CDN URL).
#      NVIDIA/optix-dev on GitHub contains all public headers at each release tag.
#      The OptiX runtime (libnvoptix.so) ships with the NVIDIA GPU driver (nvidia-utils).
#      This package provides development headers only; libnvoptix.so is already present.
#      Upgraded from AUR optix 9.0.0 to 9.1.0 (December 2025 release, requires R590+).

pkgname=optix-dev-headers
pkgver=9.1.0
pkgrel=1
pkgdesc='NVIDIA OptiX SDK development headers (runtime provided by nvidia-utils libnvoptix.so)'
arch=(any)
url='https://github.com/NVIDIA/optix-dev'
license=('LicenseRef-NvidiaOptiX')
depends=('nvidia-utils>=590')
provides=('optix')
conflicts=('optix')

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/NVIDIA/optix-dev/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a29b2254107fdfbb5e6bbad3ec154dd682149121f61e9c406607ac7b52a6ba6')

package() {
    local _srcdir="${srcdir}/optix-dev-${pkgver}"

    install -d "${pkgdir}/usr/include/optix"
    install -m644 "${_srcdir}/include/"*.h "${pkgdir}/usr/include/optix/"

    # Also install the internal headers subdirectory
    if [[ -d "${_srcdir}/include/internal" ]]; then
        install -d "${pkgdir}/usr/include/optix/internal"
        install -m644 "${_srcdir}/include/internal/"*.h "${pkgdir}/usr/include/optix/internal/"
    fi

    # Top-level optix.h symlink for conventional include paths
    ln -sr "${pkgdir}/usr/include/optix/optix.h" "${pkgdir}/usr/include/optix.h"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${_srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
