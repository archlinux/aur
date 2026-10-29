# Maintainer: gaou-piou <i dot am dot piou at gmail dot com>
# Contributor: Zane Fernandes <zane dot ferns360 at gmail dot com>
pkgname=relic-vague-gtk-theme
_repo=Vague-GTK-Theme
_commit=a2e5b05f8bb0137cfb71c9fadd546888c0a7337a
_date=2026.06.25
pkgver=2026.06.25.r9.95dc59b
pkgrel=1
pkgdesc='Vague GTK theme by Fausto-Korpsvart (archived upstream), with the relic GTK 3/4 geometry fixes'
arch=('any')
url="https://github.com/gaou-piou/${_repo}"
license=('GPL-3.0-only')
depends=('gnome-themes-extra')
optdepends=('gtk-engine-murrine: GTK 2 support')
makedepends=('git' 'sassc')
conflicts=('vague-gtk-theme-git')
options=('!strip' '!debug' '!emptydirs')
source=("${_repo}-${_commit}.tar.gz::https://github.com/gaou-piou/${_repo}/archive/${_commit}.tar.gz")
sha256sums=('ebf947bcbc99a2297e94b199b54577ce424ad3ce886635a175c7021b0cf481aa')
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

# <theme commit date>.r<count>.<commit>: the commits of gtk-theme-fixes that change the files this
# package uses (generic/, relic/), so other themes' fixes leave the version alone
pkgver() {
  local fixes=gtk-theme-fixes
  if [[ ${local_build:-} == true ]]; then
    fixes=$(_local_fixes) || return 1
  fi
  printf '%s.r%s.%s' "$_date" "$(git -C "$fixes" rev-list --count HEAD -- generic relic)" \
    "$(git -C "$fixes" log -1 --format=%h --abbrev=7 HEAD -- generic relic)"
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
