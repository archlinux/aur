# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>

pkgname=mupen64plus-video-gliden64-git
pkgver=4.0.r125.g0a5216f8
pkgrel=1
pkgdesc='A new generation, open-source graphics plugin for N64 emulators (git version)'
arch=('x86_64')
url='https://github.com/gonetz/GLideN64/'
license=('GPL2')
depends=('mupen64plus')
makedepends=('git' 'cmake' 'libgl' 'freetype2')
source=('git+https://github.com/gonetz/GLideN64.git')
provides=('mupenplus-video-gliden64')
conflicts=('mupenplus-video-gliden64')
sha256sums=('SKIP')

pkgver() {
    cd GLideN64
    #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^Public_Release_//;s/^v//;s/_/./g'
    
    local _tag
    local _version
    local _revision
    local _shorthash
    
    _tag="$(git tag | grep 'Public_Release' | sort | tail -n1)"
    _version="$(printf '%s' "$_tag" | sed 's/^Public_Release_//;s/^v//;s/_/./g')"
    _revision="$(git rev-list  --count "${_tag}...HEAD")"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    local _revision
    _revision="$(cd GLideN64 && git rev-parse --short HEAD)"
    printf '%s\n' "#define PLUGIN_REVISION \"${_revision}\"" > GLideN64/src/Revision.h
    
    cmake -B GLideN64/src/build -S GLideN64/src \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DMUPENPLUSAPI:BOOL='ON' \
        -Wno-dev
    make -C GLideN64/src/build
}

package() {
    install -D -m644 GLideN64/src/build/libmupen64plus-video-GLideN64.so -t "${pkgdir}/usr/lib/mupen64plus"
}
