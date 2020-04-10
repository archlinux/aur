# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>

pkgname=mupen64plus-video-gliden64-git
pkgver=4.0.r165.gfbd1ad1a
pkgrel=1
pkgdesc='A new generation, open-source graphics plugin for N64 emulators (git version)'
arch=('x86_64')
url='https://github.com/gonetz/GLideN64/'
license=('GPL2')
depends=('mupen64plus' 'libpng' 'zlib' 'freetype2' 'libgl')
makedepends=('git' 'cmake' 'qt5-base')
source=('git+https://github.com/gonetz/GLideN64.git')
provides=('mupenplus-video-gliden64')
conflicts=('mupenplus-video-gliden64')
sha256sums=('SKIP')

pkgver() {
    #git -C GLideN64 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^Public_Release_//;s/^v//;s/_/./g'
    
    local _tag
    local _version
    local _revision
    local _shorthash
    _tag="$(git -C GLideN64 tag | grep 'Public_Release' | sort | tail -n1)"
    _version="$(printf '%s' "$_tag" | sed 's/^Public_Release_//;s/^v//;s/_/./g')"
    _revision="$(git -C GLideN64 rev-list  --count "${_tag}...HEAD")"
    _shorthash="$(git -C GLideN64 rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd GLideN64/src
    ./getRevision.sh 2>/dev/null
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DMUPENPLUSAPI:BOOL='ON' \
        -DUSE_SYSTEM_LIBS:BOOL='ON' \
        -Wno-dev
    make -C build
}

package() {
    install -D -m644 GLideN64/src/build/plugin/Release/mupen64plus-video-GLideN64.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 GLideN64/ini/GLideN64.custom.ini -t "${pkgdir}/usr/share/mupen64plus"
}
