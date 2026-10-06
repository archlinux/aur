# Maintainer: Julien Turbide <moi at jturbide dot com>
# SPDX-License-Identifier: 0BSD

pkgname=niri-fx
pkgver=0.21.0
pkgrel=1
pkgdesc='Window effect presets, portable recipes and a visual Studio for Niri'
arch=('any')
url='https://github.com/jturbide/niri-fx'
license=('MIT AND GPL-3.0-or-later AND 0BSD')
depends=('python' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools>=77' 'python-wheel')
checkdepends=('desktop-file-utils' 'git' 'niri' 'python-pillow')
optdepends=(
  'niri: validate and apply effects on a Niri desktop'
  'chromium: open Studio in an app window'
  'quickshell: optional QML preset picker'
  'gjs: optional GTK preset picker'
  'gtk4: optional GTK preset picker'
  'libadwaita: optional GTK preset picker'
)
source=(
  "https://github.com/jturbide/niri-fx/releases/download/v${pkgver}/niri_fx-${pkgver}.tar.gz"
  'niri-fx-studio.desktop'
  'README.Arch'
  'LICENSE'
)
sha256sums=(
  '94a0c75a20ccc149186365442f78ba7c67a26257afc437d0e74c2f19c5c4368b'
  '7a3f838400c76a9b4e50749c77b8e8b285d34a19c8f716a5f916af04a12ebb34'
  '595deff577ef0d785c5d4b4091f59bd7f14586a7b0919a4b6279afdc2746406c'
  '336feffd8a99323d56058efe2b2deb3480dcf935dbb6813324c95a7e61bbbca3'
)

build() {
  cd "niri_fx-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "niri_fx-${pkgver}"
  # Tests own their temporary files and must not inherit a desktop connection.
  env -u NIRI_SOCKET -u WAYLAND_DISPLAY -u DISPLAY -u DBUS_SESSION_BUS_ADDRESS \
    -u PYTHONPATH -u PYTHONHOME PYTHONNOUSERSITE=1 \
    python -m unittest discover -s tests
  desktop-file-validate "${srcdir}/niri-fx-studio.desktop"
}

package() {
  cd "niri_fx-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/niri-fx-studio.desktop" \
    "${pkgdir}/usr/share/applications/niri-fx-studio.desktop"
  install -Dm644 niri_fx/assets/niri-fx.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/niri-fx.svg"
  install -Dm644 LICENSE THIRD_PARTY.md experimental/COPYING-NIRI \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.packaging"
  install -Dm644 "${srcdir}/README.Arch" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.Arch"
  install -Dm644 examples/profiles/*.json \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
