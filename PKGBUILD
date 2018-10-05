# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=intel-media-driver-git
pkgver=2018.3.pre3.r106.g9a64b5e4
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI — Broadwell+ iGPUs (git version)'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD')
depends=(
    # official repositories:
        'gcc-libs' 'libpciaccess'
    # AUR:
        'intel-gmmlib-git' 'libva-git'
)
makedepends=('git' 'cmake')
provides=('intel-media-driver')
conflicts=('intel-media-driver')
source=("$pkgname"::'git+https://github.com/intel/media-driver.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/^intel-media-//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DINSTALL_DRIVER_SYSCONF:BOOL='OFF' \
        -Wno-dev \
        ../"$pkgname"
        
    make
}

package() {
    cd build
    
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
