# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

pkgname=seq66
pkgver=0.99.26
pkgrel=1
pkgdesc='A live-looping MIDI sequencer with a Qt graphical interface'
arch=(aarch64 x86_64)
url='https://github.com/ahlstromcj/seq66'
license=(GPL-2.0-only GPL-3.0-or-later)
depends=(gcc-libs glibc qt5-base)
makedepends=(alsa-lib git jack liblo meson ninja qt5-tools)
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahlstromcj/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2730eb666689be3a67c1431f01e2d242449fb786590e8c58245c5c2d5f599b34')

prepare() {
  meson subprojects download --sourcedir=$pkgname-$pkgver
}

build() {
  arch-meson \
    --reconfigure \
    --buildtype=release \
    -D docdir=/usr/share/doc/$pkgname \
    $pkgname-build $pkgname-$pkgver
  meson compile -C $pkgname-build
}

package() {
  depends+=(libasound.so libjack.so liblo.so)
  meson install -C $pkgname-build --destdir "$pkgdir"
  cd $pkgname-$pkgver
  install -vDm 644 ChangeLog NEWS README.md RELNOTES ROADMAP.md TODO \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
