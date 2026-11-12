# Maintainer: Jan Cerny <cernyhonza@gmail.com>

pkgname=greycard-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A raw photo editor with a scene-referred, color-managed pipeline"
arch=('x86_64')
url="https://greycard.org"
license=('GPL-3.0-or-later')
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxrandr'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'vulkan-driver: GPU acceleration for pipeline and AI features'
)
provides=('greycard')
conflicts=('greycard')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/jessolmstead/greycard/releases/download/v${pkgver}/greycard-${pkgver}-${CARCH}-linux.tar.gz")
sha256sums_x86_64=('e5df09a72f0908312036cf0b4be6e380f37c28ec857d92c0e6e9ba86c3759cbf')

package() {
  cd "greycard-${pkgver}-${CARCH}-linux"

  # Install private binaries and shared libraries
  install -dm755 "${pkgdir}/usr/lib/greycard"
  install -m755 bin/greycard "${pkgdir}/usr/lib/greycard/greycard"
  install -m755 bin/greycard-ui "${pkgdir}/usr/lib/greycard/greycard-ui"
  install -m755 bin/libonnxruntime.so "${pkgdir}/usr/lib/greycard/libonnxruntime.so"
  install -m755 bin/libwebgpu_dawn.so "${pkgdir}/usr/lib/greycard/libwebgpu_dawn.so"

  # Create symlinks in /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/greycard/greycard "${pkgdir}/usr/bin/greycard"
  ln -s /usr/lib/greycard/greycard-ui "${pkgdir}/usr/bin/greycard-ui"

  # Desktop file
  install -Dm644 share/applications/greycard.desktop "${pkgdir}/usr/share/applications/greycard.desktop"

  # Icons
  install -Dm644 share/icons/hicolor/scalable/apps/greycard.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/greycard.svg"
  install -Dm644 share/icons/hicolor/scalable/mimetypes/application-x-greycard-edit.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-x-greycard-edit.svg"

  # MIME type definition
  install -Dm644 share/mime/packages/greycard.xml \
    "${pkgdir}/usr/share/mime/packages/greycard.xml"

  # License & documentation
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
