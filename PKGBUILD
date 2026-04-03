# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=tributary-git
pkgver=0.1.0.r0.g992a175
pkgrel=1
pkgdesc="A high-performance, Rhythmbox-style media manager (Git version)"
arch=('x86_64')
url="https://github.com/jm2/tributary"
license=('GPL-3.0-or-later')
options=(!lto)
depends=(
  'gtk4'
  'libadwaita'
  'gstreamer'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'dbus'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'pkg-config'
)
provides=('tributary')
conflicts=('tributary')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}"

  # Binary
  install -Dm755 "target/release/tributary" "$pkgdir/usr/bin/tributary"

  # Desktop entry
  install -Dm644 "data/io.github.tributary.Tributary.desktop" \
    "$pkgdir/usr/share/applications/io.github.tributary.Tributary.desktop"

  # AppStream metainfo
  install -Dm644 "data/io.github.tributary.Tributary.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.tributary.Tributary.metainfo.xml"

  # Icons
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 \
      "data/icons/hicolor/${size}x${size}/apps/io.github.tributary.Tributary.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.github.tributary.Tributary.png"
  done

  # License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
