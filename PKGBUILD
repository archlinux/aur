# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_gmmlib_commit='a5015343bc932e39747c57ea5dec0cbf28685465'

pkgname=intel-media-driver
pkgver=2018.Q2.1
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD')
depends=('gcc-libs' 'libva')
makedepends=('git' 'cmake')
conflicts=('intel-media-driver-git')
backup=('etc/profile.d/intel-media.sh')
options=('!emptydirs')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/intel/media-driver/archive/driver-for-Intel-Media-SDK-${pkgver/.Q/Q}.tar.gz"
        'gmmlib-git'::"git+https://github.com/intel/gmmlib.git#commit=${_gmmlib_commit}"
        'intel-media-driver-support-libva-2.1.0.patch')
sha256sums=('f50a23af8a2e52a0895ddc24b10aff64b1077d2e783b33e743ec663371d3dd43'
            'SKIP'
            '187e1eeadc223022195b3675f84e65014935976523ab5a37cc21658233273d55')
prepare() {
    cd "media-driver-driver-for-Intel-Media-SDK-${pkgver/.Q/Q}"
    
    patch -Np1 -i "${srcdir}/intel-media-driver-support-libva-2.1.0.patch"
}
build() {
    rm -rf build
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='etc' \
        -DINSTALL_DRIVER_SYSCONF:BOOL='ON' \
        -DMEDIA_BUILD_FATAL_WARNINGS:BOOL='OFF' \
        -DMEDIA_VERSION='2.0.0' \
        -DBUILD_ALONG_WITH_CMRTLIB='1' \
        -DBS_DIR_GMMLIB="$(pwd)/../gmmlib-git/Source/GmmLib/" \
        -DBS_DIR_COMMON="$(pwd)/../gmmlib-git/Source/Common/" \
        -DBS_DIR_INC="$(pwd)/../gmmlib-git/Source/inc/" \
        -DBS_DIR_MEDIA="$(pwd)/../media-driver-driver-for-Intel-Media-SDK-${pkgver/.Q/Q}" \
        -Wno-dev \
        ../"media-driver-driver-for-Intel-Media-SDK-${pkgver/.Q/Q}"
    
    make
}

package() {
    cd build
    
    make DESTDIR="$pkgdir" install
    
    # do not force the use of 'iHD' libva driver by default (let user choose)
    local _info='# uncomment the LIBVA_DRIVER_NAME line to use the Intel Media Driver (iHD) for VAAPI'
    sed -i "2i${_info}" "${pkgdir}/etc/profile.d/intel-media.sh"
    sed -i '/^export[[:space:]]LIBVA_DRIVER_NAME/s/^/#/' "${pkgdir}/etc/profile.d/intel-media.sh"
    
    # license
    cd "${srcdir}/media-driver-driver-for-Intel-Media-SDK-${pkgver/.Q/Q}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
