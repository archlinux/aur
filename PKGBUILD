# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_gmmlib_commit='b32d2124aa5187b20b64df24d2e83bcbe7a57d7d'

pkgname=intel-media-driver
pkgver=600.0130
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
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/intel/media-driver/archive/intel-media-${pkgver}.tar.gz"
        'gmmlib-git'::"git+https://github.com/intel/gmmlib.git#commit=${_gmmlib_commit}"
        'fix-ult-link-error-on-arch-linux.patch')
sha256sums=('6f775563cab1208aab2b2c92e37d477e2edb30136c7c6908e0bbf01e3c2239cb'
            'SKIP'
            '3e1407f4ba9d5616013d1b2a0bd3b10515f1ad268403bacef138bd0a75d45de8')

prepare() {
    cd "media-driver-intel-media-${pkgver}"
    
    # https://github.com/intel/media-driver/issues/127
    patch -Np1 -i "${srcdir}/fix-ult-link-error-on-arch-linux.patch"
}
build() {
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
        -DBS_DIR_MEDIA="$(pwd)/../media-driver-intel-media-${pkgver}" \
        -Wno-dev \
        ../"media-driver-intel-media-${pkgver}"
    
    make
}

package() {
    cd build
    
    make DESTDIR="$pkgdir" install
    
    # do not force the use of 'iHD' libva driver by default (let user choose)
    local _info='uncomment the LIBVA_DRIVER_NAME line to use the Intel Media Driver (iHD) for VAAPI'
    sed -i "2i\\ \\${_info}" "${pkgdir}/etc/profile.d/intel-media.sh"
    sed -i '/LIBVA_DRIVER_NAME/s/^/#/' "${pkgdir}/etc/profile.d/intel-media.sh"
    
    # license
    cd "${srcdir}/media-driver-intel-media-${pkgver}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
