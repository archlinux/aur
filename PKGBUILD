# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: bugix
# Contributor: Lubosz Sarnecki <lubosz at gmail>

pkgname=openni
pkgver=1.5.7.10
pkgrel=6
pkgdesc='Framework for sensor-based Natural Interaction'
arch=('i686' 'x86_64')
url='https://github.com/OpenNI/OpenNI/'
license=('APACHE')
depends=('freeglut' 'glu' 'libusb' 'java-environment' 'libjpeg-turbo' 'tinyxml')
makedepends=('dos2unix')
install="${pkgname}.install"
_srcprefix='OpenNI-Stable'
source=("${_srcprefix}-${pkgver}.tar.gz"::"https://github.com/OpenNI/OpenNI/archive/Stable-${pkgver}.tar.gz"
        '0003-Change-path-of-config-files-to-etc-openni-modified-for-1.5.7.10.patch'
        '0006-Use-system-wide-libjpeg.patch'
        '0007-Use-system-wide-tinyxml.patch'
        '0010-Including-call-to-libusb_detach_kernel_driver-to-det.patch'
        '0016-Rename-equivalent-to-fix-compilation-on-gcc6.patch'
        'libopenni.pc')
sha256sums=('34b0bbf68633bb213dcb15408f979d5384bdceb04e151fa519e107a12e225852'
            'd967d715bc530eac42246182680d6a02e8f4c4251d38bd2aeabc38b9aabe6ebd'
            '7690bc720b3f1a06333b6ba6ca2e44f8c1b964fa31a5c1e25c112d1a2a46ae59'
            'cf45346cd7c1a6d564dc4512c2b24852fc797c9ade57d7819446e214a88f3275'
            '3f60387926942f2cad4bb775738148ac5a9fa765f8873e035d8357c8d4e34ef2'
            '69cbbde667d2ad18bfb3e9933bda05d0cae36d575a4082912bbc42b7c754cd8c'
            '90b67ed122eb33df96d9935421d79b620f87e791d8773e00c1406ebafd01a364')

prepare() {
    cd "${_srcprefix}-${pkgver}"
    
    # needed for patch 0003
    dos2unix Samples/NiAudioSample/NiAudioSample.cpp
    dos2unix Samples/NiCRead/NiCRead.c
    dos2unix Samples/NiSimpleRead/NiSimpleRead.cpp
    dos2unix Samples/NiSimpleSkeleton/NiSimpleSkeleton.cpp
    dos2unix Samples/NiSimpleViewer/NiSimpleViewer.cpp
    unix2dos Samples/NiSkeletonBenchmark/NiSkeletonBenchmark.cpp
    dos2unix Samples/NiUserSelection/UserTracker.cpp
    dos2unix Samples/NiUserTracker/main.cpp
    dos2unix Samples/NiViewer/NiViewer.cpp
    
    dos2unix Source/OpenNI/Linux/XnUSBLinux.cpp # needed for patch 0010
    dos2unix Samples/NiViewer/glh/glh_linear.h  # needed for patch 0016
    
    patch -Np1 -i "${srcdir}/0003-Change-path-of-config-files-to-etc-openni-modified-for-1.5.7.10.patch"
    patch -Np1 -i "${srcdir}/0006-Use-system-wide-libjpeg.patch"
    patch -Np1 -i "${srcdir}/0007-Use-system-wide-tinyxml.patch"
    patch -Np1 -i "${srcdir}/0010-Including-call-to-libusb_detach_kernel_driver-to-det.patch"
    patch -Np1 -i "${srcdir}/0016-Rename-equivalent-to-fix-compilation-on-gcc6.patch"
}

build() {
    cd "${_srcprefix}-${pkgver}/Platform/Linux/Build"
    make
}

package() {
    [ "$CARCH" = 'x86_64' ] && local _architecture='x64'
    [ "$CARCH" = 'i686'   ] && local _architecture='x86'
    
    # directories creation
    mkdir -p "${pkgdir}/usr/include/ni/"{Linux-Arm,Linux-x86}
    mkdir -p "${pkgdir}/usr/"{lib,share/doc/"${pkgname}"}
    
    # binaries and libraries
    cd "${_srcprefix}-${pkgver}/Platform/Linux/Bin/${_architecture}-Release"
    install -D -m755 niLicense niReg NiViewer -t "${pkgdir}/usr/bin"
    install -D -m755 *.so "${pkgdir}/usr/lib"
    
    # headers
    cd "${srcdir}/${_srcprefix}-${pkgver}/Include"
    install -D -m644 *.h         "${pkgdir}/usr/include/ni"
    install -D -m644 Linux-Arm/* "${pkgdir}/usr/include/ni/Linux-Arm"
    install -D -m644 Linux-x86/* "${pkgdir}/usr/include/ni/Linux-x86"
    
    # config
    ## /etc/openni is populated at build time
    ## /var/lib/ni is populated at install time
    cd "${srcdir}/${_srcprefix}-${pkgver}/Data"
    install -D -m644 SamplesConfig.xml -t "${pkgdir}/etc/openni"
    mkdir -p "${pkgdir}/var/lib/ni"
    
    # pkg-config file
    cd "$srcdir"
    install -D -m644 libopenni.pc -t "${pkgdir}/usr/lib/pkgconfig"
    
    # documentation
    cd "${_srcprefix}-${pkgver}/Documentation"
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    cd "${srcdir}/${_srcprefix}-${pkgver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NOTICE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
