# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-media-driver-git
pkgver=2018.3.pre1.r130.g10f382d1
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI (git version)'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD')
depends=(
    # official repositories:
        'gcc-libs' 'libpciaccess'
    # AUR:
        'gmmlib-git' 'libva-git'
)
makedepends=('git' 'cmake')
provides=('intel-media-driver')
conflicts=('intel-media-driver')
backup=('etc/profile.d/intel-media.sh')
options=('!emptydirs')
install="${pkgname}.install"
source=("$pkgname"::'git+https://github.com/intel/media-driver.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    local _prefix='intel-media-'
    git describe --long --tags | sed "s/^${_prefix}//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/^18\./2018./"
}

build() {
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL='OFF' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='etc' \
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
