pkgname=black-glass-plasma-theme-git
_pkgname=black-glass
pkgver=r46.eda83cf
pkgrel=1
pkgdesc="Black Glass theme for KDE Plasma"
arch=('any')
url="https://www.opencode.net/phob1an/blackglass"
license=('GPL-3.0-only')

depends=(
  'plasma-workspace'
  'kwin'
  'kvantum'
)

makedepends=(
  'git'
)

optdepends=(
  'sddm: use the included SDDM login theme'
  'sddm-kcm: configure SDDM from KDE System Settings'
  'konsole: use any included Konsole color scheme'
)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(
  "${_pkgname}::git+https://www.opencode.net/phob1an/blackglass.git#branch=master"
)

sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}


package() {
  cd "${srcdir}/${_pkgname}"

  local _installed=0

  _install_dir() {
    local src="$1"
    local dst="$2"

    [[ -d "$src" ]] || return 1

    install -dm755 "${pkgdir}/${dst}"
    cp -dr --no-preserve=ownership "${src}/." "${pkgdir}/${dst}/"
    _installed=1
  }

  # Plasma desktop themes
  _install_dir "desktoptheme" "usr/share/plasma/desktoptheme" || true
  _install_dir "desktop-theme" "usr/share/plasma/desktoptheme" || true
  _install_dir "plasma/desktoptheme" "usr/share/plasma/desktoptheme" || true

  # Plasma Global Themes / Look-and-Feel packages
  _install_dir "look-and-feel" "usr/share/plasma/look-and-feel" || true
  _install_dir "lookandfeel" "usr/share/plasma/look-and-feel" || true
  _install_dir "plasma/look-and-feel" "usr/share/plasma/look-and-feel" || true

  # Aurorae / KWin window decorations
  _install_dir "aurorae" "usr/share/aurorae/themes" || true
  _install_dir "Aurorae" "usr/share/aurorae/themes" || true

  # Color schemes
  _install_dir "color-schemes" "usr/share/color-schemes" || true
  _install_dir "colorschemes" "usr/share/color-schemes" || true
  _install_dir "colorscheme" "usr/share/color-schemes" || true
  _install_dir "ColorSchemes" "usr/share/color-schemes" || true

  # Kvantum themes
  _install_dir "Kvantum" "usr/share/Kvantum" || true
  _install_dir "kvantum" "usr/share/Kvantum" || true

  # SDDM login theme
  _install_dir "sddm" "usr/share/sddm/themes" || true
  _install_dir "sddm-theme" "usr/share/sddm/themes" || true
  _install_dir "sddmtheme" "usr/share/sddm/themes" || true

  # Optional extras
  #_install_dir "wallpapers" "usr/share/wallpapers" || true
  _install_dir "konsole" "usr/share/konsole" || true
  _install_dir "icons" "usr/share/icons" || true
  _install_dir "cursors" "usr/share/icons" || true

  # License file, if present
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  elif [[ -f COPYING ]]; then
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  fi

  if (( _installed == 0 )); then
    echo "ERROR: no known KDE theme directories were found."
    echo "Inspect the repo tree and adjust package() paths."
    return 1
  fi
}
