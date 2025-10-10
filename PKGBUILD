# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=libopenshot-audio-git
pkgname=(
    'libopenshot-audio-git'
    'libopenshot-audio-docs-git')
pkgver=0.4.0.r12.g5bd5f2d
pkgrel=1
pkgdesc='A high-quality audio editing and playback library used by libopenshot (git version)'
arch=('x86_64')
url='https://www.openshot.org/'
license=('GPL-3.0-or-later')
makedepends=(
    'alsa-lib'
    'cmake'
    'doxygen'
    'freetype2'
    'git'
    'libx11'
    'zlib')
source=('git+https://github.com/OpenShot/libopenshot-audio.git')
sha256sums=('SKIP')

pkgver() {
    git -C libopenshot-audio describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libopenshot-audio \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

package_libopenshot-audio-git() {
    depends=(
        'alsa-lib'
        'gcc-libs'
        'glibc'
        'zlib')
    provides=('libopenshot-audio' 'libopenshot-audio.so')
    conflicts=('libopenshot-audio')
    options=('!emptydirs')
    
    DESTDIR="$pkgdir" cmake --install build
    mkdir -p docs-pkg/usr/share
    mv "${pkgdir}/usr/share"/{doc,man} docs-pkg/usr/share
}

package_libopenshot-audio-docs-git() {
    pkgdesc="$(sed 's/(\(git\)/(documentation; \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('libopenshot-audio-docs')
    conflicts=('libopenshot-audio-docs')
    
    mv -T docs-pkg "$pkgdir"
}
