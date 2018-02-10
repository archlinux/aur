# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=vmaf-git
pkgname=libvmaf-git
pkgver=1.3.1.r58.g755c93c
pkgrel=1
pkgdesc='Library for perceptual video quality assessment based on multi-method fusion (git version)'
arch=('i686' 'x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
makedepends=('git')
provides=('libvmaf')
conflicts=('libvmaf')
source=("${_srcname}"::"git+https://github.com/Netflix/${_srcname%-git}.git"
        'submodule-sureal'::'git+https://github.com/Netflix/sureal.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "${_srcname}"
    
    git submodule init
    git config --local submodule.sureal.url "${srcdir}/submodule-sureal"
    git submodule update
}

pkgver() {
    cd "${_srcname}"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_srcname}"
    make all
}

package() {
    cd "${_srcname}"
    make DESTDIR="$pkgdir" INSTALL_PREFIX='/usr' install
    
    # fix prefixes on pkgconfig file
    sed -i 's|/usr/local|/usr|g' "${pkgdir}/usr/lib/pkgconfig/libvmaf.pc"
}
