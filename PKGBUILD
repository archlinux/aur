# Maintainer: dreieck

_pkgname=ddplan
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple menubar application with timetables for trams, buses and trains in Dresden. (Dresdner Verkehrsbetriebe/ DVB backend.)"
arch=(
  "x86_64"
)
url="https://github.com/4gray/ddplan"
license=(
  'MIT'
)
depends=(
  'gcc-libs'
  'glibc'
  'libcairo.so'
  'libdrm'
  'libasound.so'
  'libatk-1.0.so'        # at-spi2-core
  'libatk-bridge-2.0.so' # at-spi2-core
  'libatspi.so'          # at-spi2-core
  'libcups'
  'libdbus-1.so'
  'libgio-2.0.so'      # glib2
  'libglib-2.0.so'     # glib2
  'libgobject-2.0.so'  # glib2
  'libexpat.so'
  'libgtk-3.so'
  'libpango-1.0.so'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon.so'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
)
makedepends=(
  'libarchive'  # For 'bsdtar'
  'zopfli'      # For 'zopflipng'
)
optdepends=(
  'hicolor-icon-theme: For icon filesystem hirarchy support.'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=(
  "${_pkgname}-git<=1.0.0+r21.20250720.3ec001c"  # 'ddplan-git' I could no longer get to build from source (NPM hell). So this prebuilt package replaces 'ddplan-git' up to that version.
)
source=(
  "${_pkgname}_${pkgver}_amd64.deb::https://github.com/4gray/ddplan/releases/download/v${pkgver}/ddplan_${pkgver}_amd64.deb"
  # "${_pkgname}-${pkgver}.${CARCH}.rpm::https://github.com/4gray/ddplan/releases/download/v${pkgver}/ddplan-${pkgver}.${CARCH}.rpm"
  # "${_pkgname}-${pkgver}.AppImage::https://github.com/4gray/ddplan/releases/download/v${pkgver}/DDPlan-${pkgver}.AppImage"
  "${_pkgname}-${pkgver}-README.md::https://github.com/4gray/ddplan/raw/refs/heads/master/README.md"
  "${_pkgname}-${pkgver}-LICENSE::https://github.com/4gray/ddplan/raw/refs/heads/master/LICENSE"
)
sha256sums=(
  '8839a9de1d67146d4a0435722ca0c508ab75432cd84fb6bf91cea215d3b961bb'
  # '5fc2ca2c0ee1d50140d83f901158041e6fef103bf1ba2f09e4db5aee998b407d'
  # '61245f32737133c13601ab44bc4d9e2a0f2a30cf398bf6efaaa4eb1fe93f2344'
  'SKIP'
  'SKIP'
)

package() {
  cd "${srcdir}"

  ## Extracting pre-compiled software into place ...
  bsdtar -C "${pkgdir}" -xvf data.tar.xz


  ## Installing README and license files ...
  install -Dvm644  "${_pkgname}-${pkgver}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644  "${_pkgname}-${pkgver}-LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.ddplan.txt"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/opt/DDPlan"/LICENSE*


  ## Creating symlink in '/usr/bin/' ...
  install -dvm755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -sv '/opt/DDPlan/ddplan' ddplan

  ## Size-optimizing PNG files ...
  cd "${pkgdir}"
  local _png
  for _png in `find -type f -name '*.png'`; do
    zopflipng -y -m "${_png}" "${_png}"  # Wow. That saves about 75% of filesize!
  done
}
