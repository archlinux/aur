# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=1.9.9
pkgrel=2
pkgdesc="Digital Voice for Radio Amateurs"
arch=('x86_64' 'aarch64')
license=('LGPL2.1')
url="https://freedv.org/"
# leave sioclient as an internal build
depends=('libpulse' 'hamlib' 'sox' 'wxwidgets-gtk3' 'codec2-lpcnet' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'lpcnetfreedv' 'portaudio')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4dd699d147ae5e3dd3469d96ccd52b128d98845a8b46d0dd9a72fce861d83bb0b90f92c937ac6be2dc6e77697a65f3b149442d6b00d9dcb1ba61edccd5bc0437')

# we use portaudio because it discovers all
# pipewire interfaces and applications

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_INTERNAL_CODEC2=FALSE \
    -DUSE_STATIC_SPEEXDSP=FALSE \
    -DUSE_STATIC_PORTAUDIO=FALSE \
    -DBOOTSTRAP_WXWIDGETS=FALSE \
    -DUSE_PULSEAUDIO=FALSE
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -m644 -D "$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
