# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# this binary package is currently provided by the intel-compute-runtime
# repository. $pkgver is currently inherited from there.

pkgname=intel-graphics-compiler-bin
pkgver=18.43.999
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
source=("https://github.com/intel/compute-runtime/releases/download/18.43.11744/intel-igc-core_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/18.43.11744/intel-igc-opencl_${pkgver}_amd64.deb"
        'LICENSE')
noextract=("intel-igc-core_${pkgver}_amd64.deb"
           "intel-igc-opencl_${pkgver}_amd64.deb")
sha256sums=('633cbb8e05cafb7b768735035c85f2bb6e7d7bfb357792ebf0eef8636cacbf4a'
            '3aaab1ccb9e0e837b59727d7dea4963bee16f6e3353b17ac9ad5374fca636243'
            '0a17bb0830659515e66a960a6fd553d9ef939bc8097066e1c8f4954d562c252c')

prepare() {
    mkdir -p igc-{core,opencl}-"$pkgver"
    
    cd "igc-core-${pkgver}"
    bsdtar -xf "${srcdir}/intel-igc-core_${pkgver}_amd64.deb" -s'|[^/]*/||'
    
    cd "${srcdir}/igc-opencl-${pkgver}"
    bsdtar -xf "${srcdir}/intel-igc-opencl_${pkgver}_amd64.deb" -s'|[^/]*/||'
}

package() {
    cd "igc-core-${pkgver}"
    tar -Jxf data.tar.xz -C "$pkgdir"
    mv "$pkgdir"/usr/local/lib/* "${pkgdir}/usr/lib"
    
    cd "${srcdir}/igc-opencl-${pkgver}"
    tar -Jxf data.tar.xz -C "$pkgdir"
    
    # fix wrong ownerships
    chown root:root "$pkgdir"/usr/lib/libig{a64,c}.so
    
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
