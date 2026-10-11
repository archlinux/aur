pkgname=neodisk
pkgver=2.83.2
pkgrel=1
pkgdesc="Disk space visualizer with treemap and sunburst views"
arch=('x86_64' 'aarch64')
url="https://github.com/tkslucas/Neodisk"
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gtk4>=4.14'
  'harfbuzz'
  'libadwaita>=1.5'
  'pango'
  'swift-bin>=6.4'
  'vulkan-icd-loader'
  'zstd'
)
makedepends=('patchelf' 'pkgconf')
conflicts=('neodisk-git' 'neodisk-bin')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb6d4def632a0b9516869b07fefec1abc07bb1be005ed90c8ce8bc245e826aad')

prepare() {
  cd "Neodisk-${pkgver}"
  swift package --force-resolved-versions resolve
}

build() {
  cd "Neodisk-${pkgver}"
  swift build -c release --product neodisk \
    --disable-automatic-resolution
  patchelf --set-rpath /usr/lib/swift/usr/lib/swift/linux .build/release/neodisk
}

package() {
  cd "Neodisk-${pkgver}"
  install -Dm755 .build/release/neodisk "${pkgdir}/usr/bin/neodisk"
  install -d "${pkgdir}/usr/share/neodisk"
  cp -a Localization Packaging/linux/icons "${pkgdir}/usr/share/neodisk/"

  local size
  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "Packaging/linux/app-icon/${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.lucastakayasu.Neodisk.png"
  done
  install -Dm644 Packaging/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.lucastakayasu.Neodisk.png"
  install -Dm644 Packaging/linux/com.lucastakayasu.Neodisk.desktop \
    "${pkgdir}/usr/share/applications/com.lucastakayasu.Neodisk.desktop"
  install -Dm644 Packaging/linux/com.lucastakayasu.Neodisk.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.lucastakayasu.Neodisk.metainfo.xml"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
