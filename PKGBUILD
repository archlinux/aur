# Maintainer: Richard Fleming <rfleming@acqusys.com>
pkgname=taskeract
pkgver=2.2.0
pkgrel=1
pkgdesc="Desktop app for orchestrating AI coding agents"
arch=('x86_64')
url="https://f001.backblazeb2.com/file/taskeract-pub/releases"
license=('LicenseRef-Taskeract_EULA')
depends=(
  'webkit2gtk-4.1'
  'openssl'
  'libayatana-appindicator'
  'librsvg'
)
install=taskeract.install
options=('!strip')
source=(
  "${pkgname}-${pkgver}.deb::${url}/v${pkgver}/Taskeract_${pkgver}_amd64.deb"
)
sha256sums=('cfbd07aca9eae2bf55492018f353def35803a7ac44918433f6ec24311be0aac9')

prepare() {
  cd "${srcdir}"
  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.*
}

package() {
  # Binary
  install -Dm755 "${srcdir}/usr/bin/taskeract" \
    "${pkgdir}/usr/bin/taskeract"

  # Desktop entry (add MimeType for taskeract:// URI scheme if not present)
  local _desktop="${srcdir}/usr/share/applications/Taskeract.desktop"
  if ! grep -q "MimeType=" "$_desktop"; then
    echo "MimeType=x-scheme-handler/taskeract;" >> "$_desktop"
  fi
  install -Dm644 "$_desktop" "${pkgdir}/usr/share/applications/taskeract.desktop"

  # Icons
  for icon in "${srcdir}"/usr/share/icons/hicolor/*/apps/taskeract.png; do
    [ -f "$icon" ] || continue
    size_dir="${icon#*hicolor/}"
    size_dir="${size_dir%%/apps*}"
    install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size_dir}/apps/taskeract.png"
  done
}
