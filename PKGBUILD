pkgname=mactahoe-plasma-theme-git
_pkgname=mactahoe-plasma-theme
_iconsname=mactahoe-icon-theme
_gtkname=mactahoe-gtk-theme

pkgver=r29.cbf6a1f
pkgrel=1
pkgdesc="Mactahoe KDE theme by vinceliuice. This package includes plasma and gtk themes, icons and cursors."
arch=('any')
options=('!strip' '!debug')
url="https://github.com/vinceliuice/MacTahoe-kde"
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

provides=('mactahoe-plasma-theme')

conflicts=(
  'mactahoe-plasma-theme'
  'mactahoe-icon-theme'
  'mactahoe-cursor-theme'
  'mactahoe-gtk-theme'
)

source=(
  "${_pkgname}::git+https://github.com/vinceliuice/MacTahoe-kde.git"
  "${_iconsname}::git+https://github.com/vinceliuice/MacTahoe-icon-theme.git"
  "${_gtkname}::git+https://github.com/vinceliuice/MacTahoe-gtk-theme.git"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {

  # Plasma theme
  cd "${srcdir}/${_pkgname}"

  # Ensure install.sh uses the system installation paths
  sed -i \
    -e 's|if \[ "$UID" -eq "$ROOT_UID" \]; then|if true; then|g' \
    -e 's|if \[\[ "$UID" -eq "$ROOT_UID" \]\]; then|if true; then|g' \
    install.sh

  # layout-templates is the only system path not based on --dest
  sed -i \
    -e "s|LAYOUT_DIR=\"/usr/share/plasma/layout-templates\"|LAYOUT_DIR=\"${pkgdir}/usr/share/plasma/layout-templates\"|g" \
    install.sh

  # We don't care about wallpapers
  sed -i \
    -e '/WALLPAPER_DIR/d' \
    -e '/wallpapers/d' \
    install.sh

  bash install.sh --dest "${pkgdir}/usr"

  # Delete useless Aurorae magnifications
  rm -rf \
    "${pkgdir}"/usr/share/aurorae/themes/*-1.25x \
    "${pkgdir}"/usr/share/aurorae/themes/*-1.5x


  # Icon + cursor theme
  cd "${srcdir}/${_iconsname}"

  bash install.sh --dest "${pkgdir}/usr/share/icons"


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
