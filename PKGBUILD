pkgname=neodisk-git
pkgver=2.83.2.r312.g1572007
pkgrel=1
pkgdesc="Disk space visualizer with treemap and sunburst views (Git version)"
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
makedepends=('git' 'patchelf' 'pkgconf')
provides=("neodisk=${pkgver}")
conflicts=('neodisk' 'neodisk-bin')
options=('!debug')
source=('Neodisk::git+https://github.com/tkslucas/Neodisk.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd Neodisk
  local version
  version="$(sed -n 's/.*static let string = "\([^"]*\)".*/\1/p' Sources/NeodiskAppModel/AppVersion.swift)"
  printf '%s.r%s.g%s' "${version}" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd Neodisk
  swift package --force-resolved-versions resolve
}

build() {
  cd Neodisk
  swift build -c release --product neodisk \
    --disable-automatic-resolution
  patchelf --set-rpath /usr/lib/swift/usr/lib/swift/linux .build/release/neodisk
}

package() {
  cd Neodisk
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
