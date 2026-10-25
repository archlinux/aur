# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Flávio Zavan <flavio dot zavan at gmail dot com>

pkgname=mupen64plus-video-gliden64-git
pkgver=4.0.r770.ga04081ad
pkgrel=1
pkgdesc='A new generation, open-source graphics plugin for N64 emulators (git version)'
arch=('x86_64')
url='https://github.com/gonetz/GLideN64/'
license=('GPL-2.0-only')
depends=(
    'freetype2'
    'glibc'
    'libgl'
    'libpng'
    'libstdc++'
    'mupen64plus'
    'zlib'
    'zstd')
makedepends=(
    'cmake'
    'git'
    'qt6-base')
provides=('mupenplus-video-gliden64')
conflicts=('mupenplus-video-gliden64')
source=('git+https://github.com/gonetz/GLideN64.git')
sha256sums=('SKIP')

prepare() {
    cd GLideN64/src
    ./getRevision.sh
}

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
    cmake -B build -S GLideN64/src \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DGLIDENUI_QT6:BOOL='ON' \
        -DMUPENPLUSAPI:BOOL='ON' \
        -DUSE_SYSTEM_LIBS:BOOL='ON' \
        -Wno-author
    make -C build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
