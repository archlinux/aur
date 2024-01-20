# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=1.9.7.2
pkgrel=2
pkgdesc="Digital Voice for Radio Amateurs"
arch=('x86_64' 'aarch64')
license=('LGPL2.1')
url="https://freedv.org/"
# leave sioclient as an internal build
depends=('libpulse' 'hamlib' 'sox' 'wxwidgets-gtk3' 'codec2-lpcnet' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'lpcnetfreedv' 'portaudio')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('22d817bcce915f37680eed36410318d9bf0a7188230289914b5098c284d85a02edb1667ffafcce93f3ee179e546d38b25d29fff7b082e85c1605f472f9aa1885')

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
