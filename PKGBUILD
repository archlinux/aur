# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-media-driver
pkgver=2018.3.0
_srcver="$(printf '%s' "$pkgver" | sed -E 's/(^[0-9]{2})([0-9]{2})/\2/')"
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD')
depends=(
    # official repositories:
        'gcc-libs' 'libva' 'libpciaccess'
    # AUR:
        'gmmlib'
)
makedepends=('cmake')
conflicts=('intel-media-driver-git')
backup=('etc/profile.d/intel-media.sh')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/intel/media-driver/archive/intel-media-${_srcver}.tar.gz")
sha256sums=('df9af1cc796b4123508aacaf19d040cc5d8c5742c05199f45c9a3905ed8d1b52')

build() {
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='etc' \
        -Wno-dev \
        ../"media-driver-intel-media-${_srcver}"
        
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
    cd "${srcdir}/media-driver-intel-media-${_srcver}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
