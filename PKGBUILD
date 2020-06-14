# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-stack-bin
pkgver=2020.1.1
pkgrel=1
pkgdesc='Tools and libraries for developing media solutions on Intel products (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=('gcc-libs' 'libpciaccess' 'libgl' 'libdrm' 'libx11' 'libxext'
         'libxfixes' 'wayland')
optdepends=('ocl-icd: for rotate_opencl plugin'
            'intel-compute-runtime: for rotate_opencl plugin')
provides=('intel-media-sdk' 'libmfx' 'intel-gmmlib' 'intel-media-driver'
          'libva' 'libva-utils')
conflicts=('intel-media-sdk' 'libmfx' 'intel-gmmlib' 'intel-media-driver'
           'libva' 'libva-utils')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Intel-Media-SDK/MediaSDK/releases/download/intel-mediasdk-${pkgver:2}/MediaStack.tar.gz"
        '010-intel-media-stack-bin-fix-install.patch')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('f411ded6381dc3ffc4827852e6ff56cfb32abad6669b45afed8a90cd7678a3d8'
            '660d31d03c64d40aa7c1c25304ce40469a159e415ba70957b8f21acecbb91af5')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}.tar.gz" -C "${pkgname}-${pkgver}" -s '|[^/]*/||'
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/opt/intel/mediasdk/bin"/* -t "${pkgdir}/usr/bin"
    cp -a "${pkgname}-${pkgver}/opt/intel/mediasdk/"{include,share} "${pkgdir}/usr"
    cp -a "${pkgname}-${pkgver}/opt/intel/mediasdk/doc" "${pkgdir}/usr/share"
    cp -a "${pkgname}-${pkgver}/opt/intel/mediasdk/lib64" "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/lib/dri"
    mv "${pkgdir}/usr/lib/iHD_drv_video.so" "${pkgdir}/usr/lib/dri"
    ln -sf ../../share/mfx/plugins.cfg "${pkgdir}/usr/lib/mfx/plugins.cfg"
    ln -s ../share/mfx/samples/_bin/libcttmetrics.so "${pkgdir}/usr/lib/libcttmetrics.so"
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
