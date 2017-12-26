# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-vaapi-media-driver-git
pkgver=r18.0b7e123
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI (git version)'
arch=('i686' 'x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD')
depends=(
     # AUR:
         'libva-git'
)
makedepends=('git' 'cmake')
provides=('intel-vaapi-media-driver')
conflicts=('intel-vaapi-media-driver')
options=('!emptydirs')
install=intel-vaapi-media-driver-git.install
source=("$pkgname"::'git+https://github.com/intel/media-driver.git'
        'gmmlib-git'::'git+https://github.com/intel/gmmlib.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
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
    
    [ "$CARCH" = 'x86_64' ] && mv -f "${pkgdir}/usr/lib64/"*.so "${pkgdir}/usr/lib"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
