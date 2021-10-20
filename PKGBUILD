# Maintainer: Cristóbal Tapia <crtapia at gmail dot com>

pkgname=obs-ghostscript
pkgver=1.3
pkgrel=1
obspkgname=obs-studio
obspkgver=27.1.3
pkgdesc="OBS Plugin to allow inclusion of PDF documents in scenes"
arch=('x86_64' 'i686')
url="https://github.com/nleseul/${pkgname}"
license=('Unlincense')
depends=('obs-studio' 'ghostscript')
makedepends=('make')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
         $obspkgname-$obspkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$obspkgver.tar.gz)
sha256sums=('ef06d36d1ce42515f89cd56180aa38f4aaad612f28feb5d8e90cbe4d6bfba078'
            '4dfdb018b33ec0a90eb3a7e5a174afd58d52d583990680264afedf678961db1d')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's:data/obs-plugins:share/obs/obs-plugins:g' CMakeLists.txt
    sed -i 's:obs-plugins/${_lib_suffix}bit:lib/obs-plugins:g' CMakeLists.txt
}

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. \
        -DOBSSourcePath=${srcdir}/${obspkgname}-${obspkgver}/libobs/ \
        -DOBSLibraryPath=/usr/lib/obs-plugins/ \
        -DCMAKE_INSTALL_PREFIX='/usr'
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}

# vim:set ts=4 sw=4 et:
