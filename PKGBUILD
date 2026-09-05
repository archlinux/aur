pkgname=whitesur-plasma-theme-git
_pkgname=WhiteSur-kde
_iconsname=WhiteSur-icon-theme
_cursorsname=WhiteSur-cursors
_gtkname=WhiteSur-gtk-theme

pkgver=2024.11.18.r16.gcf4df59
pkgrel=1
pkgdesc="macOS Big Sur-like KDE Plasma theme"
arch=('any')
options=('!strip' '!debug')
url="https://github.com/vinceliuice/WhiteSur-kde"
license=('GPL-3.0-only')

makedepends=(
  'git'
  'sassc'
)

depends=(
  'plasma-workspace'
  'kwin'
  'kvantum'
)

provides=('whitesur-plasma-theme')

conflicts=(
  'whitesur-plasma-theme'
  'whitesur-icon-theme'
  'whitesur-cursor-theme'
  'whitesur-gtk-theme'
  'kvantum-theme-whitesur'
  'whitesur-kde-theme'
)

source=(
  "${_pkgname}::git+https://github.com/vinceliuice/WhiteSur-kde.git"
  "${_iconsname}::git+https://github.com/vinceliuice/WhiteSur-icon-theme.git"
  "${_cursorsname}::git+https://github.com/vinceliuice/WhiteSur-cursors.git"
  "${_gtkname}::git+https://github.com/vinceliuice/WhiteSur-gtk-theme.git"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
}

package() {

  # Plasma theme
  cd "${srcdir}/${_pkgname}"

  # Modify the root installation of the script to go to fakeroot
  sed -i \
    -e "s|/usr/share/aurorae/themes|${pkgdir}/usr/share/aurorae/themes|g" \
    -e "s|/usr/share/color-schemes|${pkgdir}/usr/share/color-schemes|g" \
    -e "s|/usr/share/plasma/desktoptheme|${pkgdir}/usr/share/plasma/desktoptheme|g" \
    -e "s|/usr/share/plasma/look-and-feel|${pkgdir}/usr/share/plasma/look-and-feel|g" \
    -e "s|/usr/share/Kvantum|${pkgdir}/usr/share/Kvantum|g" \
    install.sh

  # We don't care about wallpapers or latte dock
  sed -i \
    -e '/WALLPAPER_DIR/d' \
    -e '/wallpaper/d' \
    -e '/LATTE_DIR/d' \
    -e '/latte-dock/d' \
    install.sh

  # Ensure the script executes the modified fakeroot paths
  sed -i \
    -e 's|if \[ "$UID" -eq "$ROOT_UID" \]; then|if true; then|g' \
    install.sh

  bash install.sh

  # delete useless magnifications
  rm -rf \
    "${pkgdir}"/usr/share/aurorae/themes/WhiteSur_x* \
    "${pkgdir}"/usr/share/aurorae/themes/WhiteSur-dark_x* \
    "${pkgdir}"/usr/share/aurorae/themes/WhiteSurLiquid_x* \
    "${pkgdir}"/usr/share/aurorae/themes/WhiteSurLiquid-dark_x*

  # Icon theme
  cd "${srcdir}/${_iconsname}"

  sed -i \
    -e "s|/usr/share/icons|${pkgdir}/usr/share/icons|g" \
    install.sh

  sed -i \
    -e 's|if \[ "$UID" -eq "$ROOT_UID" \]; then|if true; then|g' \
    install.sh

  bash install.sh -p #-t all
  bash install.sh -a -p -n "WhiteSur-Alt" #-t all

  # Cursor theme
  cd "${srcdir}/${_cursorsname}"

  sed -i \
    -e "s|/usr/share/icons|${pkgdir}/usr/share/icons|g" \
    install.sh

  sed -i \
    -e 's|if \[ "$UID" -eq "$ROOT_UID" \]; then|if true; then|g' \
    install.sh

  bash install.sh

  # GTK theme
  cd "${srcdir}/${_gtkname}"

  bash install.sh --dest "${pkgdir}/usr/share/themes"

  # Package files
  cd "${srcdir}/${_pkgname}"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
