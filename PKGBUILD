# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>

pkgname=mupen64plus-video-gliden64-git
_srcname=GLideN64
pkgver=3.0.r249.gd420737d
pkgrel=1
pkgdesc='A new generation, open-source graphics plugin for N64 emulators (git version)'
arch=('i686' 'x86_64')
url='https://github.com/gonetz/GLideN64/'
license=('GPL2')
depends=('mupen64plus' 'libgl' 'freetype2')
makedepends=('git' 'cmake')
source=('git+https://github.com/gonetz/GLideN64.git')
provides=('mupenplus-video-gliden64')
conflicts=('mupenplus-video-gliden64')
sha256sums=('SKIP')

prepare() {
    cd "${_srcname}/src"
    
    printf '%s\n' "#define PLUGIN_REVISION \"${pkgver}\"" > Revision.h
    
    mkdir -p build
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^Public_Release_//;s/^v//;s/_/./g'
}

build() {
    cd "${_srcname}/src/build"
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DMUPENPLUSAPI:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${_srcname}/src/build/plugin/Release"
    
    install -D -m644 mupen64plus-video-GLideN64.so -t "${pkgdir}/usr/lib/mupen64plus"
}
