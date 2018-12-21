# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# this binary package is currently provided by the intel-compute-runtime
# repository. $pkgver is currently inherited from there.

pkgname=intel-graphics-compiler-bin
pkgver=18.48.1124
_icrver=18.49.11968 # intel-compute-runtime version
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=(
    # official repositories:
        'gcc-libs' 'zlib'
    # AUR:
        'ncurses5-compat-libs'
)
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler' 'compute-runtime')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/compute-runtime/releases/download/${_icrver}/intel-igc-core_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${_icrver}/intel-igc-opencl_${pkgver}_amd64.deb"
        'LICENSE')
noextract=("intel-igc-core_${pkgver}_amd64.deb"
           "intel-igc-opencl_${pkgver}_amd64.deb")
sha256sums=('f0dd87998a290a713295e9b3498fc49545e7e4c15710ed1d11055e160c1bff17'
            '7aaf3560d86a8c6be7e7dbc696a16cd030ccc8aea5fda07bcb86d2dbe3590de2'
            '0a17bb0830659515e66a960a6fd553d9ef939bc8097066e1c8f4954d562c252c')

prepare() {
    mkdir -p igc-{core,opencl}-"$pkgver"
    
    bsdtar -xf "intel-igc-core_${pkgver}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-opencl_${pkgver}_amd64.deb" -C "igc-opencl-${pkgver}"
}

package() {
    tar -Jxf "igc-core-${pkgver}/data.tar.xz" -C "$pkgdir"
    tar -Jxf "igc-opencl-${pkgver}/data.tar.xz" -C "$pkgdir"
    
    mv "$pkgdir"/usr/local/lib/* "${pkgdir}/usr/lib"
    
    # fix wrong ownerships
    chown root:root "$pkgdir"/usr/{,lib/}
    chown root:root "$pkgdir"/usr/lib/*
    
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
