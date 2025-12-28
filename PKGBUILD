# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=jack_link
pkgver=0.2.6
pkgrel=1
pkgdesc='JACK transport bridge to Ableton Link'
arch=(aarch64 x86_64)
url='https://github.com/rncbc/jack_link'
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc)
makedepends=(asio git jack)
groups=(pro-audio)
source=("git+https://github.com/rncbc/$pkgname#tag=v$pkgver"
        'git+https://github.com/Ableton/link')
sha256sums=('2268587290d30bc4f3502cda7fd2bf8fb39a62635fe025fb5f203f270f077604'
            'SKIP')

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
  depends+=(libjack.so)
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
