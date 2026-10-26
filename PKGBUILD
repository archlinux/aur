
# Maintainer: Stefan Gruenberger <stefan.gruenberger at gmail dot com>
# Contributor: cheapl <cheapl@icloud.com>

pkgname=onedrivegui
_pkgname=OneDriveGUI
pkgver=2.4.0
pkgrel=1
pkgdesc="A simple GUI for OneDrive Linux client, with multi-account support."
license=("GPL-3.0-or-later")
depends=(
  "python"
  "pyside6"
  "python-requests"
  "onedrive-abraunegg>=2.5.11"
  "qt6-webengine"
)
makedepends=(
  "git"
  "python-build"
  "python-installer"
  "python-wheel"
)
conflicts=("onedrivegui-git")
provides=("onedrivegui")
arch=("any")
url="https://github.com/bpozdena/${_pkgname}"

_tag="v${pkgver}"
source=("git+$url.git#tag=$_tag" "onedrivegui.desktop")
sha256sums=('5327b485a85bdf77c618f5282abe4dbcfaaf2096916ea24de396a961336c11e1'
            'd26149240e17b6a99d865026b9fdfe53475d430fc2ca2e516965489061e9feae')

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"

  # Install Python package and console entry point
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Keep the existing onedrivegui command for compatibility
  install -d "${pkgdir}/usr/bin"
  ln -s onedrive-gui "${pkgdir}/usr/bin/onedrivegui"

  # Install application icon
  install -Dm644 \
    src/onedrive_gui/resources/images/OneDriveGUI.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/onedrivegui.png"

  # Install desktop entry
  install -Dm644 \
    "${srcdir}/onedrivegui.desktop" \
    "${pkgdir}/usr/share/applications/onedrivegui.desktop"

  # Install license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
