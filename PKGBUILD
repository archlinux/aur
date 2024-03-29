# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

pkgname=seq66
pkgver=0.99.12
pkgrel=2
pkgdesc='A live-looping MIDI sequencer with a Qt graphical interface'
arch=(aarch64 x86_64)
url='https://github.com/ahlstromcj/seq66'
license=(GPL-2.0-only GPL-3.0-or-later)
depends=(gcc-libs glibc graphite qt5-base)
makedepends=(alsa-lib git jack liblo)
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahlstromcj/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        'fix-liblo.patch::https://github.com/ahlstromcj/seq66/commit/666a467b.patch'
        'seq66-docdir.patch')
sha256sums=('c840cf85f463a4888ed9454c79fe22e812dece70c1e6b78970b5330573f3f332'
            'ca820cc9763d7217d2782a51bf2d4a072c132dd4065153a9b81a717161bce0cc'
            'c689e2bfc95002483830c4ddc75694748be6f40a6a88ca8f983640f558285558')

prepare() {
  cd $pkgname-$pkgver
  patch -p0 -N -r - -i "$srcdir"/seq66-docdir.patch
  # fix liblo 0.32 header compatibility
  patch -Np1 -i "$srcdir"/fix-liblo.patch
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
