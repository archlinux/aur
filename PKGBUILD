# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver-legacy-bin
pkgver=24.3.4
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI (legacy platforms, pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/vpl-gpu-rt/'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'intel-gmmlib-legacy'
    'libva')
makedepends=('chrpath')
provides=(
    "intel-media-driver=${pkgver}"
    "intel-media-driver-legacy=${pkgver}")
conflicts=('intel-media-driver')
options=('!strip')
source=("intel-media-stack-bin-${pkgver}.tar.gz"::"https://github.com/intel/vpl-gpu-rt/releases/download/intel-onevpl-${pkgver}/MediaStack.tar.gz")
noextract=("intel-media-stack-bin-${pkgver}.tar.gz")
sha256sums=('ce46a0cba85cbeb5b86245bf30f21d0364f6dc7bc5258f462f05fab5943788da')

prepare() {
    mkdir -p "intel-media-stack-bin-${pkgver}"
    bsdtar -xf "intel-media-stack-bin-${pkgver}.tar.gz" -C "intel-media-stack-bin-${pkgver}" -s '|[^/]*/||'
}

package() {
    install -d -m755 "${pkgdir}/usr"/{include,lib}
    cp -dr --no-preserve='ownership' "intel-media-stack-bin-${pkgver}/opt/intel/media/include/igfxcmrt" "${pkgdir}/usr/include"
    cp -dr --no-preserve='ownership' "intel-media-stack-bin-${pkgver}/opt/intel/media/lib64"/libigfxcmrt.so* "${pkgdir}/usr/lib"
    install -D -m644 "intel-media-stack-bin-${pkgver}/opt/intel/media/lib64/iHD_drv_video.so" -t "${pkgdir}/usr/lib/dri"
    install -D -m644 "intel-media-stack-bin-${pkgver}/opt/intel/media/lib64/pkgconfig/igfxcmrt.pc" -t "${pkgdir}/usr/lib/pkgconfig"
    install -D -m644 "intel-media-stack-bin-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # remove insecure rpath
    chrpath -d "${pkgdir}/usr/lib/dri/iHD_drv_video.so"
}
