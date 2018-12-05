# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libva-utils-git
_srcname=libva-utils
pkgver=2.2.1.pre1.20180921.r5.g375e4ea
pkgrel=1
pkgdesc='Intel VA-API media applications and scripts for libva (git version)'
arch=('i686' 'x86_64')
url='https://github.com/01org/libva-utils/'
license=('custom')
depends=('libva')
makedepends=('git' 'meson' 'mesa')
provides=('libva-utils')
conflicts=('libva-utils')
source=('git+https://github.com/intel/libva-utils.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    arch-meson . build
    ninja -C build
}

package() {
    cd "$_srcname"
    
    DESTDIR="$pkgdir" ninja -C build install
    
    # avoid conflict with h264enc from package openh264
    mv "${pkgdir}/usr/bin/h264enc" "${pkgdir}/usr/bin/h264enc-libva-utils"
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
