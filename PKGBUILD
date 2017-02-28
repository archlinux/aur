# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: bugix
# Contributor: Lubosz Sarnecki <lubosz at gmail>

pkgname=openni
pkgver=1.5.7.10
pkgrel=3
pkgdesc="An interface for physical devices and for middleware components"
arch=('i686' 'x86_64')
url="https://github.com/OpenNI/OpenNI/"
license=('APACHE')
depends=('freeglut' 'glu' 'libusb' 'java-environment')
makedepends=('dos2unix')
install="${pkgname}.install"
_srcprefix="OpenNI-Stable"
source=("${_srcprefix}-${pkgver}.tar.gz"::"https://github.com/OpenNI/OpenNI/archive/Stable-${pkgver}.tar.gz"
        '0016-Rename-equivalent-to-fix-compilation-on-gcc6.patch'
        'libopenni.pc')
sha256sums=('34b0bbf68633bb213dcb15408f979d5384bdceb04e151fa519e107a12e225852'
            '69cbbde667d2ad18bfb3e9933bda05d0cae36d575a4082912bbc42b7c754cd8c'
            '90b67ed122eb33df96d9935421d79b620f87e791d8773e00c1406ebafd01a364')

prepare() {
    cd "${srcdir}/${_srcprefix}-${pkgver}"
    dos2unix Samples/NiViewer/glh/glh_linear.h
    patch -Np1 -i "${srcdir}/0016-Rename-equivalent-to-fix-compilation-on-gcc6.patch"
}

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
    mkdir -p "${pkgdir}/usr/"{bin,include/ni/{Linux-Arm,Linux-x86}}
    mkdir -p "${pkgdir}/usr/"{lib/pkgconfig,share/{doc/"${pkgname}",licenses/"${pkgname}"}}
    mkdir -p "${pkgdir}/etc/openni" # config (populated at build   time)
    mkdir -p "${pkgdir}/var/lib/ni" # config (populated at install time)
    
    # binaries and libraries
    cd "${srcdir}/${_srcprefix}-${pkgver}/Platform/Linux/Bin/${_architecture}-Release"
    install -D -m755 niLicense niReg NiViewer "${pkgdir}/usr/bin"
    install -D -m755 *.so "${pkgdir}/usr/lib"
    
    # includes
    cd "${srcdir}/${_srcprefix}-${pkgver}/Include"
    install -D -m644 *.h         "${pkgdir}/usr/include/ni"
    install -D -m755 Linux-Arm/* "${pkgdir}/usr/include/ni/Linux-Arm"
    install -D -m755 Linux-x86/* "${pkgdir}/usr/include/ni/Linux-x86"
    
    # config
    cd "${srcdir}/${_srcprefix}-${pkgver}/Data"
    install -D -m644 SamplesConfig.xml "${pkgdir}/etc/openni"
    
    # pkg-config file
    cd "$srcdir"
    install -D -m644 libopenni.pc "${pkgdir}/usr/lib/pkgconfig"
    
    # documentation
    cd "${srcdir}/${_srcprefix}-${pkgver}/Documentation"
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    cd "${srcdir}/${_srcprefix}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}"
}
