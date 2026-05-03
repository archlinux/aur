# Maintainer: Andersmmg <andersmmg at duck dot com>
pkgname=hyprmod-git
_pkgname=hyprmod
pkgver=r43.83b9838
pkgrel=1
pkgdesc="A native GTK4/libadwaita settings app for Hyprland."
arch=('x86_64')
url="https://github.com/BlueManCZ/hyprmod"
license=('GPL-3.0-only')
depends=(
  'python'
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-hyprland-config'
  'python-hyprland-monitors'
  'python-hyprland-schema'
  'python-hyprland-socket'
  'python-hyprland-state'
  'hyprland'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
optdepends=()
source=("${_pkgname}::git+https://github.com/BlueManCZ/hyprmod.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=HyprMod
Comment=GTK4/libadwaita settings app for Hyprland
Exec=hyprmod
Icon=preferences-desktop-wallpaper
Terminal=false
Type=Application
Categories=Settings;GTK;
StartupNotify=true
EOF
}
