# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# this binary package is currently provided by the intel-compute-runtime
# repository. $pkgver is currently inherited from there.

pkgname=intel-graphics-compiler-bin
pkgver=18.44.1060
_icrver=18.46.11837 # intel-compute-runtime version
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
sha256sums=('00fe6aae32b0818e833db8fc1ec38b3b70326a5fdb54b0f49ea1badc79d8271a'
            '00079138c79e22cd022de6ce0318b6fa0c0eaf2ec1ba312ae628bf8d06ed570c'
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
