# Maintainer: gaou-piou <i dot am dot piou at gmail dot com>
# Contributor: Zane Fernandes <zane dot ferns360 at gmail dot com>
pkgname=relic-catppuccin-gtk-theme
_repo=Catppuccin-GTK-Theme
_commit=a0f69cc33299dc97267c3507fe8a001aecc46b0f
_fixes=2026.10.22
pkgver=2026.06.25
pkgrel=3
pkgdesc='Catppuccin GTK theme by Fausto-Korpsvart (archived upstream), with the relic GTK 3/4 geometry fixes'
arch=('any')
url="https://github.com/gaou-piou/${_repo}"
license=('GPL-3.0-only')
depends=('gnome-themes-extra')
optdepends=('gtk-engine-murrine: GTK 2 support')
makedepends=('sassc')
conflicts=('catppuccin-gtk-theme-git')
options=('!strip' '!debug' '!emptydirs')
source=("${_repo}-${_commit}.tar.gz::https://github.com/gaou-piou/${_repo}/archive/${_commit}.tar.gz"
        "relic-gtk-fixes-${_fixes}.tar.gz::https://github.com/gaou-piou/relic-gtk-fixes/archive/refs/tags/${_fixes}.tar.gz")
sha256sums=('2d478e2e8c7540eba92fe668fbef0136d4b448410d41789483faf413befe687c'
            'c43a7f638dd859fc113ecc99789eb27700d20b26e90b93b966f8cdc00bef22fb')

prepare() {
  local sass="${_repo}-${_commit}/themes/src/sass"
  local fixes="relic-gtk-fixes-${_fixes}"

  cp "${fixes}/generic/fixes-3.0.scss" "${sass}/_fixes-3.0.scss"
  cp "${fixes}/generic/fixes-4.0.scss" "${sass}/_fixes-4.0.scss"
  cp "${fixes}/relic/fixes-variables.scss" "${sass}/_fixes-variables.scss"
  cp "${fixes}/relic/local-fixes-4.0.scss" "${sass}/_local-fixes-4.0.scss"
  cp "${fixes}/relic/local-fixes-gnome-shell.scss" "${sass}/_local-fixes-gnome-shell.scss"
  : > "${sass}/_local-fixes-3.0.scss"

  local f
  for f in "${_repo}-${_commit}/themes/src/main/gtk-3.0/"*.scss; do
    printf '\n%s\n' "@import '../../sass/fixes-variables';" "@import '../../sass/fixes-3.0';" "@import '../../sass/local-fixes-3.0';" >> "$f"
  done
  for f in "${_repo}-${_commit}/themes/src/main/gtk-4.0/"*.scss; do
    printf '\n%s\n' "@import '../../sass/fixes-variables';" "@import '../../sass/fixes-4.0';" "@import '../../sass/local-fixes-4.0';" >> "$f"
  done
  # GNOME Shell fixes (notification banner hover etc.), at the end of each shell entry file
  for f in "${_repo}-${_commit}/themes/src/main/gnome-shell/"*.scss; do
    printf '\n%s\n' "@import '../../sass/local-fixes-gnome-shell';" >> "$f"
  done
}

package() {
  cd "${_repo}-${_commit}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  install -d "${pkgdir}/usr/share/themes"
  cd themes
  # every accent, light and dark, standard size, macOS-style window buttons
  BATCH_MODE=true ./install.sh \
    --dest "${pkgdir}/usr/share/themes" \
    -a all \
    --mode light dark \
    --size standard \
    --tweaks macos
}
