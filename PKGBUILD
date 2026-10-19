# Maintainer: misaka19465 <19465@misakanet.team>

pkgname=gal-transl-bin
pkgver=8.4.2
pkgrel=1
pkgdesc='Automated translation solution for visual novels supporting GPT/Claude/Deepseek/Sakura (prebuilt desktop client)'
arch=('x86_64')
url='https://github.com/GalTransl/GalTransl'
license=('GPL-3.0-only')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
  'xdg-utils'
  'zlib'
)
provides=("gal-transl=${pkgver}")
conflicts=('gal-transl')
# Stripping the PyInstaller backend would remove its embedded Python archive.
options=('!strip' '!debug')
source=(
  'gal-transl.desktop'
  "galtransl-${pkgver}.png::https://raw.githubusercontent.com/GalTransl/GalTransl/${pkgver}/desktop/src-tauri/icons/128x128@2x.png"
)
sha256sums=(
  '1957c2696e51108785454b4f4e1952fc96a7fe5873a84cbea7046ffb9c823d84'
  '9d0829dd6777484355b9c0d567d708e802852380b278e8407fa03c408cfec85f'
)
source_x86_64=(
  "${url}/releases/download/${pkgver}/GalTransl_${pkgver}_linux_x86_64.tar.gz"
)
sha256sums_x86_64=(
  '9a81ec1aae33a9d45a3368010cd10e825b49d73021b939c60ea7cee477f5cf72'
)

package() {
  cd "${srcdir}/GalTransl_${pkgver}_linux_x86_64"

  # Keep the portable layout so the desktop client can locate its backend/resources.
  install -Dm755 galtransl-desktop "${pkgdir}/usr/lib/gal-transl/galtransl-desktop"
  install -Dm755 backend/galtransl_backend \
    "${pkgdir}/usr/lib/gal-transl/backend/galtransl_backend"
  cp -a Dict plugins res translation_guidelines "${pkgdir}/usr/lib/gal-transl/"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/gal-transl/galtransl-desktop "${pkgdir}/usr/bin/gal-transl"
  ln -s /usr/lib/gal-transl/galtransl-desktop "${pkgdir}/usr/bin/galtransl-desktop"

  install -Dm644 "${srcdir}/gal-transl.desktop" \
    "${pkgdir}/usr/share/applications/gal-transl.desktop"
  install -Dm644 "${srcdir}/galtransl-${pkgver}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gal-transl.png"
}
