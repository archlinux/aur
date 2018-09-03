# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-media-driver-git
pkgver=2018.3.pre2.r28.gad8945ce.gmmlib.18.3.pre1.r0.g99ff764
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI (git version)'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD')
depends=(
    # official repositories:
        'gcc-libs' 'libpciaccess'
    # AUR:
        'libva-git'
)
makedepends=('git' 'cmake')
provides=('intel-media-driver' 'gmmlib' 'gmmlib-git')
conflicts=('intel-media-driver' 'gmmlib' 'gmmlib-git')
backup=('etc/profile.d/intel-media.sh')
options=('!emptydirs')
install="${pkgname}.install"
source=("$pkgname"::'git+https://github.com/intel/media-driver.git'
        'gmmlib-git'::'git+https://github.com/intel/gmmlib.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    
    local _prefix='intel-media-'
    local _driver_ver
    local _gmmlib_ver
    
    # git, tags available
    
    _driver_ver="$(git describe --long --tags | sed "s/^${_prefix}//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/^18\./2018./")"
    
    cd "${srcdir}/gmmlib-git"
    
    _gmmlib_ver="$(git describe --long --tags | sed 's/^intel-gmmlib-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
    
    printf '%s.gmmlib.%s' "$_driver_ver" "$_gmmlib_ver"
}

build() {
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='etc' \
        -DINSTALL_DRIVER_SYSCONF:BOOL='ON' \
        -DMEDIA_BUILD_FATAL_WARNINGS:BOOL='OFF' \
        -DMEDIA_VERSION='2.0.0' \
        -DBS_DIR_GMMLIB="$(pwd)/../gmmlib-git/Source/GmmLib/" \
        -DBS_DIR_COMMON="$(pwd)/../gmmlib-git/Source/Common/" \
        -DBS_DIR_INC="$(pwd)/../gmmlib-git/Source/inc/" \
        -DBS_DIR_MEDIA="$(pwd)/../${pkgname}" \
        -Wno-dev \
        ../"$pkgname"
        
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
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
