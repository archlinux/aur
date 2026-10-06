# Maintainer: Julien Turbide <moi at jturbide dot com>
# SPDX-License-Identifier: 0BSD

pkgname=niri-fx-git
pkgver=0.21.0.r75.g3b8e03e
pkgrel=1
pkgdesc='Window effect presets, portable recipes and a visual Studio for Niri'
arch=('any')
_pkgname=niri-fx
url='https://github.com/jturbide/niri-fx'
license=('MIT AND GPL-3.0-or-later AND 0BSD')
provides=("niri-fx=${pkgver%%.r*}")
conflicts=('niri-fx')
depends=('python' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools>=77' 'python-wheel' 'git')
checkdepends=('desktop-file-utils' 'niri' 'python-pillow')
optdepends=(
  'niri: validate and apply effects on a Niri desktop'
  'chromium: open Studio in an app window'
  'quickshell: optional QML preset picker'
  'gjs: optional GTK preset picker'
  'gtk4: optional GTK preset picker'
  'libadwaita: optional GTK preset picker'
)
source=(
  "${_pkgname}::git+https://github.com/jturbide/niri-fx.git#branch=main"
  'niri-fx-studio.desktop'
  'README.Arch'
  'LICENSE'
)
sha256sums=(
  'SKIP'
  '7a3f838400c76a9b4e50749c77b8e8b285d34a19c8f716a5f916af04a12ebb34'
  '7a042d7b2a3fbfbd8794b7901222e790a88ef556d4d52a21560c2c1f7ec0bed6'
  '336feffd8a99323d56058efe2b2deb3480dcf935dbb6813324c95a7e61bbbca3'
)

pkgver() {
  cd "${_pkgname}"
  local _version
  _version=$(python -c 'import tomllib; print(tomllib.load(open("pyproject.toml", "rb"))["project"]["version"])')
  printf '%s.r%s.g%s' "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  # makepkg may reuse this checkout after the Python version metadata changes.
  git clean -dfx
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"
  # Tests own their temporary files and must not inherit a desktop connection.
  env -u NIRI_SOCKET -u WAYLAND_DISPLAY -u DISPLAY -u DBUS_SESSION_BUS_ADDRESS \
    -u PYTHONPATH -u PYTHONHOME PYTHONNOUSERSITE=1 \
    python -m unittest discover -s tests
  desktop-file-validate "${srcdir}/niri-fx-studio.desktop"
}

package() {
  cd "${_pkgname}"
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
    "${pkgdir}/usr/share/doc/${_pkgname}/README.Arch"
  install -Dm644 examples/profiles/*.json \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/examples"
}
