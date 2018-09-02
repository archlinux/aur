# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libva-intel-driver-git
pkgver=2.2.0.pre1.r7.gd805098c
pkgrel=1
pkgdesc='VA-API implementation for Intel G45 and HD Graphics family (git version)'
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi/'
license=('MIT')
depends=(
    # official repositories:
        'libdrm'
    # AUR:
        'libva-git'
)
makedepends=('git' 'meson')
provides=('libva-intel-driver')
conflicts=('libva-intel-driver')
replaces=('libva-driver-intel')
source=("$pkgname"::'git+https://github.com/intel/intel-vaapi-driver.git')
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    
    # Only relevant if intel-gpu-tools is installed,
    # since then the shaders will be recompiled
    sed -i '1s/python$/&2/' src/shaders/gpp.py
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    arch-meson . build
    ninja -C build
}

package() {
    cd "$pkgname"
    
    DESTDIR="$pkgdir" ninja -C build install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
