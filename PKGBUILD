# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

pkgname=seq66
pkgver=0.99.9
pkgrel=1
pkgdesc='A live-looping MIDI sequencer with a Qt graphical interface'
arch=(aarch64 x86_64)
url='https://github.com/ahlstromcj/seq66'
license=(GPL2)
depends=(gcc-libs glibc graphite qt5-base)
makedepends=(alsa-lib git jack liblo)
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahlstromcj/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        'seq66-docdir.patch')
sha256sums=('0baf931c034346d06b86b6a52c9f84996813160b2cad49d18dbc033f0fef86c8'
            'c689e2bfc95002483830c4ddc75694748be6f40a6a88ca8f983640f558285558')

prepare() {
  cd $pkgname-$pkgver
  patch -p0 -N -r - -i "$srcdir"/seq66-docdir.patch
}

build() {
  cd $pkgname-$pkgver
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --enable-both \
    --enable-port-refresh \
    --enable-rtmidi
  make -j$(nproc --ignore=1)
}

package() {
  depends+=(libasound.so libjack.so liblo.so)
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 ChangeLog NEWS README.md RELNOTES ROADMAP.md TODO \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
