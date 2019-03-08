# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# this binary package is currently provided by the intel-compute-runtime
# repository. $pkgver is currently inherited from there.

pkgname=intel-graphics-compiler-bin
pkgver=19.07.1542
_icrver=19.09.12487 # intel-compute-runtime version
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('gcc-libs' 'zlib')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler' 'compute-runtime')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/compute-runtime/releases/download/${_icrver}/intel-igc-core_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${_icrver}/intel-igc-opencl_${pkgver}_amd64.deb"
        'LICENSE')
noextract=("intel-igc-core_${pkgver}_amd64.deb"
           "intel-igc-opencl_${pkgver}_amd64.deb")
sha256sums=('9e5c130df7fe95b860f4c761620bf6fd5f814930df3f06c5e698aa846cadece5'
            '964e714899347564af99fe2a3619e7e630e52b74a88d96f183a27a934bbe79ca'
            '4099c7bc8a69e9e9c82f898e75870435cc0ca989a816a8ba6e38faabc88f0c36')

prepare() {
    mkdir -p igc-{core,opencl}-"$pkgver"
    
    bsdtar -xf "intel-igc-core_${pkgver}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-opencl_${pkgver}_amd64.deb" -C "igc-opencl-${pkgver}"
}

package() {
    tar -Jxf "igc-core-${pkgver}/data.tar.xz" -C "$pkgdir"
    tar -Jxf "igc-opencl-${pkgver}/data.tar.xz" -C "$pkgdir"
    
    mkdir -p "${pkgdir}/usr/lib"
    mv "$pkgdir"/usr/local/lib/* "${pkgdir}/usr/lib"
    
    # fix wrong ownerships
    chown root:root "$pkgdir"/usr/{,lib/}
    chown root:root "$pkgdir"/usr/lib/*
    
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
