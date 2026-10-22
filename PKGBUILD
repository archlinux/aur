# Maintainer: Georgy Kulish <g.kulish@moyklass.com>

pkgname=loop-desktop-bin
_pkgname=loop-desktop
pkgver=6.0.3
pkgrel=1
pkgdesc='Desktop client for the Loop team messenger'
arch=('x86_64')
url='https://loop.ru'
license=('Apache-2.0')
depends=(
  alsa-lib
  at-spi2-core
  cairo
  dbus
  expat
  glib2
  gtk3
  libcups
  libnotify
  libsecret
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nspr
  nss
  pango
  systemd-libs
  xdg-utils
)
optdepends=('pciutils: GPU device information')
makedepends=('imagemagick')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=(
  "https://artifacts.wilix.dev/repository/loop-files/loop-${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
  'https://www.apache.org/licenses/LICENSE-2.0.txt'
  "${_pkgname}.desktop"
)
sha256sums=(
  'c6a6c44935181ee99d55bc5c68c8bcdfcc20095047d3929fb01641f903b03619'
  'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
  'c3d1494413ac12555c3124a370414a24e1ba20f8edf785aa8c85fc581dd7fcb3'
)

prepare() {
  local size
  local srcpng="${srcdir}/${_pkgname}-${pkgver}-linux-x64/${_pkgname}.png"

  for size in 16 24 32 48 64 128 256; do
    magick "$srcpng" -resize "${size}x${size}" "${srcdir}/${_pkgname}-${size}.png"
  done
}

package() {
  local src="${srcdir}/${_pkgname}-${pkgver}-linux-x64"
  local dest="${pkgdir}/usr/lib/${_pkgname}"
  local size

  install -dm755 "$dest"
  cp -a "${src}/." "$dest/"
  chmod 4755 "${dest}/chrome-sandbox"
  # Upstream helper writes a desktop file with the Mattermost URL scheme.
  rm -f "${dest}/create_desktop_file.sh"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "${srcdir}/${_pkgname}-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done
  install -Dm644 "${src}/${_pkgname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -Dm644 "${srcdir}/LICENSE-2.0.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${src}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${src}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
