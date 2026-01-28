# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=lib-cava
pkgver=0.10.7
pkgrel=1
pkgdesc='Fork to provide cava as a shared library under the library name `cava`, e.g. for shell built with Quickshell. Cava is not provided as executable.'
arch=('x86_64')
url='https://github.com/LukashonakV/cava'
license=('MIT')
depends=(
    'fftw'
    'ncurses'
    'alsa-lib'
    'iniparser'
    'libglvnd'
    'sdl2'
    'portaudio'
    'sndio'
    'libpulse'
    'libpipewire'
)
makedepends=(
    'base-devel'
    'cmake'
    'meson'
    'autoconf-archive'
)
source=(
    "lib-cava-0.10.7-1.patch"
    "$pkgname-$pkgver.tar.gz::https://github.com/LukashonakV/cava/archive/v$pkgver-beta.tar.gz"
)
sha256sums=(
    '3eb85157370dc5b07f79d9e1097df409b0a80aaf670f614207039b5ca08dc6ab'
    '8915d7214f2046554c158fe6f2ae518881dfb573e421ea848727be11a5dfa8c4'
)
options=(!lto)

prepare() {
    echo $(pwd)
    cd "cava-$pkgver-beta"

    patch -p1 -i ../lib-cava-0.10.7-1.patch
}

build() {
    cd "cava-${pkgver}-beta"

    meson setup \
          -Dcava_font=false \
          --prefix=/usr \
          build

    meson compile \
          -C \
          build
}

package() {
    cd "${srcdir}/cava-${pkgver}-beta"

    DESTDIR="$pkgdir" meson install \
          -C \
          build

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
