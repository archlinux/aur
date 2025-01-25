# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_link_commit="41d9aa111f702e78b6fbaee9d3e06dda1db6420d"
pkgname=jack_link
pkgver=0.2.3
pkgrel=1
pkgdesc='JACK transport bridge to Ableton Link'
arch=(aarch64 x86_64)
url='https://github.com/rncbc/jack_link'
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc)
makedepends=(asio jack)
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rncbc/jack_link/archive/refs/tags/v$pkgver.tar.gz"
        "link-$_link_commit.tar.gz::https://github.com/Ableton/link/archive/$_link_commit.tar.gz")
sha256sums=('709947415eb4e3ac50d5aa55b69480d5e74b20f7fd8b6d61df33e129f40354fd'
            '013a6fc8d24086904717e723667099cc6645e36f960be7046707e186e5626067')

prepare() {
  cd $pkgname-$pkgver
  test -d link && rm -rf link
  ln -s "$srcdir"/link-$_link_commit link
}

build() {
  cd $pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  depends+=(libjack.so)
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
