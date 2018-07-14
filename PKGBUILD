# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_gmmlib_commit='5ff84b923ec2ba1572c464dc8def73348571b440'

pkgname=intel-media-driver
pkgver=2018.2.0
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
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/intel/media-driver/archive/intel-media-${pkgver/2018/18}.tar.gz"
        'gmmlib-git'::"git+https://github.com/intel/gmmlib.git#commit=${_gmmlib_commit}")
sha256sums=('3dde23c791a3e7781970c902a74b4d569a898ae5d34a094fe0b4e94ad41e830e'
            'SKIP')

build() {
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL='OFF' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='etc' \
        -DINSTALL_DRIVER_SYSCONF:BOOL='ON' \
        -DMEDIA_BUILD_FATAL_WARNINGS:BOOL='OFF' \
        -DMEDIA_VERSION='2.0.0' \
        -DBS_DIR_GMMLIB="$(pwd)/../gmmlib-git/Source/GmmLib/" \
        -DBS_DIR_COMMON="$(pwd)/../gmmlib-git/Source/Common/" \
        -DBS_DIR_INC="$(pwd)/../gmmlib-git/Source/inc/" \
        -DBS_DIR_MEDIA="$(pwd)/../media-driver-intel-media-${pkgver/2018/18}" \
        -Wno-dev \
        ../"media-driver-intel-media-${pkgver/2018/18}"
    
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
    cd "${srcdir}/media-driver-intel-media-${pkgver/2018/18}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
