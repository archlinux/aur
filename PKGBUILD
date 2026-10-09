# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>

pkgname=seq66
pkgver=0.99.28
pkgrel=1
pkgdesc='A live-looping MIDI sequencer with a Qt graphical interface'
arch=(aarch64 x86_64)
url='https://github.com/ahlstromcj/seq66'
license=(GPL-2.0-only GPL-3.0-or-later)
depends=(glibc libgcc libstdc++ qt5-base)
makedepends=(alsa-lib git jack liblo meson ninja qt5-tools)
optdepends=('bash: JACK and Pulseaudio helper scripts')
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahlstromcj/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('64de2fb642f770e1727c3f1c4e156838866092d11d94d8dd8495f3965b50d09a')

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
