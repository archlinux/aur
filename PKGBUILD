# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-media-driver-git
pkgver=r371.3d843ba.gmmlib.r34.2eea1a1
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI (git version)'
arch=('i686' 'x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD')
depends=('libva')
makedepends=('git' 'cmake')
provides=('intel-media-driver')
conflicts=('intel-media-driver')
options=('!emptydirs')
install="${pkgname}.install"
source=("$pkgname"::'git+https://github.com/intel/media-driver.git'
        'gmmlib-git'::'git+https://github.com/intel/gmmlib.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    _driver_ver="$(printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
    
    cd "${srcdir}/gmmlib-git"
    
    # git, no tags available
    _gmmlib_ver="$(printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
    
    printf '%s.gmmlib.%s' "$_driver_ver" "$_gmmlib_ver"
}

build() {
    # do not treat warnings as errors (reverts upstream commit fa0d40ee6d3d7ec34478da166b2740eaf9b7c0ce)
    cd "$pkgname"
    sed -i '/PROPERTIES[[:space:]]COMPILE_FLAGS[[:space:]]"-Werror")/d' media_driver/media_top_cmake.cmake
    
    cd "$srcdir"
    mkdir -p build
    cd build
    
    # https://github.com/intel/media-driver/issues/127
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export CXXFLAGS="${CXXFLAGS/-fno-plt/}"
    
    cmake \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DINSTALL_DRIVER_SYSCONF='ON' \
        -DMEDIA_VERSION='2.0.0' \
        -DBUILD_ALONG_WITH_CMRTLIB='1' \
        -DBS_DIR_GMMLIB="$(pwd)/../gmmlib-git/Source/GmmLib/" \
        -DBS_DIR_COMMON="$(pwd)/../gmmlib-git/Source/Common/" \
        -DBS_DIR_INC="$(pwd)/../gmmlib-git/Source/inc/" \
        -DBS_DIR_MEDIA="$(pwd)/../${pkgname}" \
        -Wno-dev \
        ../"${pkgname}"
    
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
