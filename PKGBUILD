# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=openni-primesense-sensor
pkgver=5.1.6.6
pkgrel=1
pkgdesc="PrimeSense Sensor Module for OpenNI"
arch=('i686' 'x86_64')
url="https://github.com/PrimeSense/Sensor/"
license=('APACHE')
depends=('openni')
conflicts=('sensorkinect')
install="${pkgname}.install"
_srcprefix="Sensor-Stable"
source=("${_srcprefix}-${pkgver}.tar.gz"::"https://github.com/PrimeSense/Sensor/archive/Stable-${pkgver}.tar.gz"
        'ps-engine.pc')
sha256sums=('d24797ca2d37d618346724378a664d0f37ad75c7e9e78533b8bc9188d3a97fd2'
            'd22279e17bc463bb49d8c850b25d2ffd59d4e11981082530d42988bbd3995150')

build() {
    cd "${srcdir}/${_srcprefix}-${pkgver}/Platform/Linux/Build"
    make
}

package() {
    if [ "${CARCH}" = "x86_64" ] 
    then
        _architecture="x64"
    elif [ "${CARCH}" = "i686" ] 
    then
        _architecture="x86"
    fi
    
    # directories creation
    mkdir -p "${pkgdir}/usr/"{bin,lib/pkgconfig,share/licenses/"${pkgname}"}
    mkdir -p "${pkgdir}/usr/lib/udev/rules.d" # usb rules (udev rules)
    mkdir -p "${pkgdir}/etc/primesense"       # config
    mkdir -p "${pkgdir}/var/log/primesense"   # logs
    
    # binaries and libraries
    cd "${srcdir}/${_srcprefix}-${pkgver}/Platform/Linux/Bin/${_architecture}-Release"
    install -D -m755 XnSensorServer "${pkgdir}/usr/bin"
    install -D -m755 *.so           "${pkgdir}/usr/lib"
    
    # udev rules
    cd "${srcdir}/${_srcprefix}-${pkgver}/Platform/Linux/Install"
    install -D -m644 55-primesense-usb.rules "${pkgdir}/usr/lib/udev/rules.d"
    
    # config
    cd "${srcdir}/${_srcprefix}-${pkgver}/Data"
    install -D -m644 GlobalDefaults.ini "${pkgdir}/etc/primesense"
    
    # pkg-config file
    cd "$srcdir"
    install -D -m644 ps-engine.pc "${pkgdir}/usr/lib/pkgconfig"
    
    # license
    cd "${srcdir}/${_srcprefix}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}"
}
