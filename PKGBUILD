# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=1.8.10.1
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('x86_64' 'aarch64')
license=('LGPL2.1')
url="https://freedv.org/"
depends=('libpulse' 'hamlib' 'sox' 'wxwidgets-gtk3' 'codec2-lpcnet' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'lpcnetfreedv')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bf5417b50a1966594e1c89977a5cd1ae17ff269c4c2dc50f5eb8a36dd5f729beec36d2d966dd53d7576fcb407c366bf11af1e64980ccd55c83f7c3d420453b4e')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_INTERNAL_CODEC2=FALSE \
    -DUSE_STATIC_SPEEXDSP=FALSE \
    -DBOOTSTRAP_WXWIDGETS=FALSE \
    -DUSE_PULSEAUDIO=TRUE
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -m644 -D "$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
