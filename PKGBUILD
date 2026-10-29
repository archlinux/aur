# Maintainer: gaou-piou <i dot am dot piou at gmail dot com>
# Contributor: Zane Fernandes <zane dot ferns360 at gmail dot com>
pkgname=relic-nightfox-gtk-theme
_repo=Nightfox-GTK-Theme
_commit=f0212f2aa0d3d6cc0b313020d2d0122f313eafc9
_date=2025.10.23
pkgver=2025.10.23.r11.05bb2f9
pkgrel=1
pkgdesc='Nightfox GTK theme by Fausto-Korpsvart (archived upstream), with the relic GTK 3/4 geometry fixes'
arch=('any')
url="https://github.com/gaou-piou/${_repo}"
license=('AGPL-3.0-only')
depends=('gnome-themes-extra')
optdepends=('gtk-engine-murrine: GTK 2 support')
makedepends=('git' 'sassc')
conflicts=('nightfox-gtk-theme-git')
options=('!strip' '!debug' '!emptydirs')
source=("${_repo}-${_commit}.tar.gz::https://github.com/gaou-piou/${_repo}/archive/${_commit}.tar.gz")
sha256sums=('08843884ad97463bac198fb67d0c24338fae08dea5ef4cd6c236ce81fceb5783')
# The fixes follow the main branch of gtk-theme-fixes, so a change there needs no package update;
# pkgver() records which commit a build took. local_build=true: they come from a gtk-theme-fixes/
# working tree in a parent directory of this PKGBUILD instead (uncommitted changes included).
if [[ ${local_build:-} != true ]]; then
  source+=('gtk-theme-fixes::git+https://github.com/gaou-piou/gtk-theme-fixes.git')
  sha256sums+=('SKIP')
fi

_local_fixes() {
  local d=$startdir
  until [[ -d $d/gtk-theme-fixes/generic || $d == / ]]; do d=$(dirname "$d"); done
  if [[ ! -d $d/gtk-theme-fixes/generic ]]; then
    error "local_build: no gtk-theme-fixes/ in a parent directory of $startdir"
    return 1
  fi
  printf '%s\n' "$d/gtk-theme-fixes"
}

pkgver() {
  local fixes=gtk-theme-fixes
  if [[ ${local_build:-} == true ]]; then
    fixes=$(_local_fixes) || return 1
  fi
  printf '%s.r%s.%s' "$_date" "$(git -C "$fixes" rev-list --count HEAD)" "$(git -C "$fixes" rev-parse --short=7 HEAD)"
}

prepare() {
  local sass="${_repo}-${_commit}/themes/src/sass"
  local fixes=gtk-theme-fixes
  if [[ ${local_build:-} == true ]]; then
    local d
    d=$(_local_fixes) || return 1
    warning "local_build: fixes from $d (uncommitted changes included)"
    rm -rf "$fixes" && mkdir "$fixes"
    cp -r "$d/generic" "$d/relic" "$fixes/"
  fi

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
