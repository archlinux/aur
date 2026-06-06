# Maintainer: DeathKhan <DeathKhan@users.noreply.github.com>
pkgname=typst-studio-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop Typst editor with Tinymist LSP and live HTML preview"
arch=('x86_64')
url="https://github.com/DeathKhan/typst-studio"
license=('GPL-3.0-or-later')
depends=('typst' 'fuse2' 'gtk3')
optdepends=(
  'tinymist: external language server if not using the bundled binary'
)
makedepends=('imagemagick')
provides=('typst-studio')
conflicts=('typst-studio')
options=('!debug')
source=(
  "${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Typst.Studio-${pkgver}.AppImage"
  "typst-studio.desktop"
  "icon.png::${url}/raw/v${pkgver}/build/icon.png"
)
sha256sums=(
  '890f050d2227c6204a22d377750b4fa760820f075e0276c6b015d952a63fb0df'
  'f34ee73cc0aef77b2d210aee0ce3cfdd305c3ee05ae995aaaaa61a9e2ff6b6cf'
  'f0f39b2bc53cc60c4a461364ccbd21b9773daf4d8134070c1bfbefad08a05b21'
)

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
}

package() {
  install -dm755 "${pkgdir}/opt/typst-studio"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/typst-studio/typst-studio.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/typst-studio" <<'EOF'
#!/bin/sh
exec /opt/typst-studio/typst-studio.AppImage "$@"
EOF

  install -Dm644 "${srcdir}/typst-studio.desktop" \
    "${pkgdir}/usr/share/applications/typst-studio.desktop"

  for size in 16 32 48 64 128 256 512; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    magick "${srcdir}/icon.png" -resize "${size}x${size}" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/typst-studio.png"
  done
}
