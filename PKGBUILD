# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-media-driver-git
_srcname=media-driver
pkgver=2018.3.pre3.r308.g862e9600
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
source=('git+https://github.com/intel/media-driver.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
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
        ../"$_srcname"
        
    make
}

package() {
    cd build
    
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${_srcname}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
