# Maintainer: Joerg Weislogel <mutoroglin at posteo dot de>

pkgname=libcava
pkgver=0.10.1
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
    "$pkgname-$pkgver.tar.gz::https://github.com/LukashonakV/cava/archive/$pkgver.tar.gz"
    "${pkgname}_$pkgver-$pkgrel.patch"
)
sha256sums=('ae8c7339908d6febeac5ab8df4576c03c9fdbca6c8e8975daf9ce68b57038bb5'
            'd5b5641f92e7cbe56793f515f346ec5d9d90df5f8ba6195aedeefccf1a0aa12d'
)
options=(!lto)

prepare() {
    patch --directory="cava-${pkgver}" --strip=1 --input="${srcdir}/${pkgname}_${pkgver}-${pkgrel}.patch"
}

build() {
    cd "cava-${pkgver}"

    meson setup \
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
