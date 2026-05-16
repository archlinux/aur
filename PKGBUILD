# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=jack_link
pkgver=0.2.7
pkgrel=1
pkgdesc='JACK transport bridge to Ableton Link'
arch=(aarch64 x86_64)
url='https://github.com/rncbc/jack_link'
license=(GPL-2.0-or-later)
depends=(libgcc glibc libstdc++)
makedepends=(asio git jack)
groups=(pro-audio)
source=("$pkgname::git+https://github.com/rncbc/$pkgname#tag=v$pkgver"
        'link::git+https://github.com/Ableton/link.git#commit=e9a2e414d63f55f1aad158370b007a6fbdc1eeb9')
sha256sums=('e6aae89d9f1dcb40957379c22f9c6d364645c937df18ce22fec11c3b459cba70'
            '5e4ad0c3becf9f64741d78bfcf3b96335dd06472af86086a0819766b16d2b28a')

prepare() {
  cd $pkgname
  # setup submodule
  git submodule init link
  git submodule set-url link "$srcdir"/link
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $pkgname
  make PREFIX=/usr VERSION=$pkgver
}

package() {
  depends+=(libjack.so libstdc++.so)
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
