# Maintainer: pxlwh <pxlwh@aur>
pkgname=booru-viewer-git
_pkgname=booru-viewer
pkgver=0.2.9.r0.gd81fb7f
pkgrel=1
pkgdesc="Local booru image browser with Qt6 GUI (Danbooru, Gelbooru, e621, and more)"
arch=('any')
url="https://git.pax.moe/pax/booru-viewer"
license=('MIT')
depends=(
  'python'
  'python-httpx'
  'python-pillow'
  'pyside6'
  'python-mpv'
  'mpv'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
optdepends=(
  'qt6-wayland: native Wayland support (recommended on Hyprland, Sway, GNOME Wayland)'
  'plasma-integration: KDE Plasma theme and palette integration'
  'kdialog: native KDE file dialogs (pairs with plasma-integration)'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 icon.png \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
