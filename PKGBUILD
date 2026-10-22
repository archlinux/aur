# Maintainer: gaou-piou <i dot am dot piou at gmail dot com>
# Contributor: Zane Fernandes <zane dot ferns360 at gmail dot com>
pkgname=relic-material-gtk-theme
_repo=Material-GTK-Themes
_commit=55f4639ad6a9128f885305a60d230c5842711259
_fixes=2026.10.22
pkgver=2025.10.23
pkgrel=3
pkgdesc='Material GTK theme by Fausto-Korpsvart (archived upstream), with the relic GTK 3/4 geometry fixes'
arch=('any')
url="https://github.com/gaou-piou/${_repo}"
license=('GPL-3.0-only')
depends=('gnome-themes-extra')
optdepends=('gtk-engine-murrine: GTK 2 support')
makedepends=('sassc')
conflicts=('material-gtk-theme-git' 'material-gtk-theme-deepocean-git' 'material-gtk-theme-palenight-git')
options=('!strip' '!debug' '!emptydirs')
source=("${_repo}-${_commit}.tar.gz::https://github.com/gaou-piou/${_repo}/archive/${_commit}.tar.gz"
        "relic-gtk-fixes-${_fixes}.tar.gz::https://github.com/gaou-piou/relic-gtk-fixes/archive/refs/tags/${_fixes}.tar.gz")
sha256sums=('ac2ebe17d88623b49ea28b644fe3e11add4fb16e5e898595356e762cce44f53d'
            'c43a7f638dd859fc113ecc99789eb27700d20b26e90b93b966f8cdc00bef22fb')

prepare() {
  local sass="${_repo}-${_commit}/themes/src/sass"
  local fixes="relic-gtk-fixes-${_fixes}"

  cp "${fixes}/generic/fixes-3.0.scss" "${sass}/_fixes-3.0.scss"
  cp "${fixes}/generic/fixes-4.0.scss" "${sass}/_fixes-4.0.scss"
  cp "${fixes}/relic/fixes-variables.scss" "${sass}/_fixes-variables.scss"
  cp "${fixes}/relic/local-fixes-4.0.scss" "${sass}/_local-fixes-4.0.scss"
  cp "${fixes}/relic/local-fixes-gnome-shell.scss" "${sass}/_local-fixes-gnome-shell.scss"

  # GTK 3 has no border-spacing (GTK 4 only): every GTK 3 app warned about upstream's dropdown rule
  sed -i '/^\s*border-spacing:/d' "${sass}/gtk/_common-3.0.scss"

  local f
  for f in "${_repo}-${_commit}/themes/src/main/gtk-3.0/"*.scss; do
    sed -i "$(awk 'END { print NR - 1 }' "$f") a @import '../../sass/fixes-3.0';" "$f"
    sed -i "$(awk 'END { print NR - 5 }' "$f") a @import '../../sass/fixes-variables';" "$f"
  done
  for f in "${_repo}-${_commit}/themes/src/main/gtk-4.0/"*.scss; do
    sed -i "$(awk 'END { print NR - 2 }' "$f") a @import '../../sass/fixes-4.0';" "$f"
    sed -i "$(awk 'END { print NR - 6 }' "$f") a @import '../../sass/fixes-variables';" "$f"
    sed -i "/@import '..\/..\/sass\/fixes-4.0';/a @import '../../sass/local-fixes-4.0';" "$f"
  done
  # GNOME Shell fixes (notification banner hover etc.), at the end of each shell entry file
  for f in "${_repo}-${_commit}/themes/src/main/gnome-shell/"*.scss; do
    printf '\n%s\n' "@import '../../sass/local-fixes-gnome-shell';" >> "$f"
  done
}

build() {
  cd "${_repo}-${_commit}/themes"
  ./build.sh
}

package() {
  cd "${_repo}-${_commit}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  install -d "${pkgdir}/usr/share/themes"
  cd themes
  # every accent, light and dark, standard size, macOS-style window buttons
  ./install.sh --dest "${pkgdir}/usr/share/themes" --theme all --color light dark --tweaks macos
}
