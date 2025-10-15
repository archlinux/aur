# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=libcava
pkgver=0.10.6
pkgrel=2
pkgdesc='Fork to provide cava as a shared library, e.g. used by waybar. Cava is not provided as executable.'
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
    libcava-0.10.6-2.patch
    "$pkgname-$pkgver.tar.gz::https://github.com/LukashonakV/cava/archive/$pkgver.tar.gz"
)
sha256sums=('f23871d34e6ba080923903735860b99f9db705bdbabca089da06f7ebbf82482a'
            'e715c4c6a625b8dc063e57e8e81c80e4d1015ec1b98db69a283b2c6770f839f4'
)
options=(!lto)

prepare() {
    echo $(pwd)
    cd "cava-$pkgver"

    patch -p1 -i ../libcava-0.10.6-2.patch
}

build() {
    cd "cava-${pkgver}"

    meson setup \
          -Dcava_font=false \
          --prefix=/usr \
          build

    meson compile \
          -C \
          build
}

package() {
    cd "${srcdir}/cava-${pkgver}"

    DESTDIR="$pkgdir" meson install \
          -C \
          build

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
