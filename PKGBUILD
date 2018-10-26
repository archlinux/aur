# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=openni-primesense-sensor
pkgver=5.1.6.6
pkgrel=4
pkgdesc='PrimeSense Sensor Module for OpenNI'
arch=('i686' 'x86_64')
url='https://github.com/PrimeSense/Sensor/'
license=('APACHE')
depends=('openni' 'libjpeg-turbo')
conflicts=('sensorkinect')
install="${pkgname}.install"
_srcprefix='Sensor-Stable'
source=("${_srcprefix}-${pkgver}.tar.gz"::"https://github.com/PrimeSense/Sensor/archive/Stable-${pkgver}.tar.gz"
        '0005-Use-system-wide-libjpeg.patch'
        '0006-Fix-include-dirs.patch'
        'ps-engine.pc')
sha256sums=('d24797ca2d37d618346724378a664d0f37ad75c7e9e78533b8bc9188d3a97fd2'
            'cc41ece20585c552cbb813c81f3b6b8c713ef22516c3090a167a60ced0b181c9'
            '52432f9e3a25b792d2ef5d5b978bcab34568fd8b8345fcb05d6d8519f956d5f4'
            'd22279e17bc463bb49d8c850b25d2ffd59d4e11981082530d42988bbd3995150')

prepare() {
    cd "${_srcprefix}-${pkgver}"
    patch -Np1 -i "${srcdir}/0005-Use-system-wide-libjpeg.patch"
    patch -Np1 -i "${srcdir}/0006-Fix-include-dirs.patch"
}

build() {
    cd "${_srcprefix}-${pkgver}/Platform/Linux/Build"
    make
}

package() {
    [ "$CARCH" = 'x86_64' ] && local _architecture='x64'
    [ "$CARCH" = 'i686'   ] && local _architecture='x86'
    
    # directories creation
    mkdir -p "${pkgdir}/usr/"{bin,include/ni/XnEE,lib}
    mkdir -p "${pkgdir}/var/log/primesense" # logs
    
    # binaries and libraries
    cd "${_srcprefix}-${pkgver}/Platform/Linux/Bin/${_architecture}-Release"
    install -D -m755 XnSensorServer "${pkgdir}/usr/bin"
    install -D -m755 *.so           "${pkgdir}/usr/lib"
    
    # headers
    cd "${srcdir}/${_srcprefix}-${pkgver}/Include"
    install -D -m644 *.h    "${pkgdir}/usr/include/ni"
    install -D -m644 XnEE/* "${pkgdir}/usr/include/ni/XnEE"
    
    # udev rules (usb rules)
    cd "${srcdir}/${_srcprefix}-${pkgver}/Platform/Linux/Install"
    install -D -m644 55-primesense-usb.rules -t "${pkgdir}/usr/lib/udev/rules.d"
    
    # config
    ## /etc/openni/primesense is populated at build time
    ## /etc/primesense is populated at install time
    cd "${srcdir}/${_srcprefix}-${pkgver}/Data"
    install -D -m644 GlobalDefaults.ini -t "${pkgdir}/etc/openni/primesense"
    mkdir -p "${pkgdir}/etc/primesense"
    
    # pkg-config file
    cd "$srcdir"
    install -D -m644 ps-engine.pc -t "${pkgdir}/usr/lib/pkgconfig"
    
    # license
    cd "${_srcprefix}-${pkgver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
