# Maintainer: gaou-piou <i dot am dot piou at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=orchis-theme-fixed-git
_name=orchis-theme
_fixes=orchis
pkgver=2026.07.07.r5.ga4c48a4.f7.0c09bae
pkgrel=1
pkgdesc="Orchis, a Material Design GTK theme, Dracula colors, with GTK 3/4 geometry fixes (window buttons, headerbars, Nautilus, Electron/Chromium titlebars)"
arch=('any')
url='https://github.com/vinceliuice/Orchis-theme'
license=('GPL-3.0-or-later')
depends=('gtk3' 'gnome-themes-extra')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK 2 support'
            'kvantum-theme-orchis: Matching Kvantum theme'
            'tela-circle-icon-theme: Recommended icon theme')
provides=("${_name}")
conflicts=("${_name}" "${_name}-git")
options=('!strip' '!debug')
install=orchis-theme-fixed.install
source=("${_name}::git+https://github.com/vinceliuice/Orchis-theme.git")
sha256sums=('SKIP')
# The fixes follow the main branch of github.com/gaou-piou/gtk-theme-fixes, so a change there needs
# no package update; pkgver() records which commit a build took. local_build=true: they come from a
# gtk-theme-fixes/ working tree in a parent directory of this PKGBUILD instead (uncommitted changes
# included).
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

# <theme version>.f<count>.<commit>: the commits of gtk-theme-fixes that change the files this
# package uses (generic/ and its own directory), so other themes' fixes leave the version alone
pkgver() {
  local theme="$srcdir/${_name}" fixes="$srcdir/gtk-theme-fixes" v
  if [[ ${local_build:-} == true ]]; then
    fixes=$(_local_fixes) || return 1
  fi
  if v=$(git -C "$theme" describe --long --tags --abbrev=7 2>/dev/null); then
    v=$(sed 's/\([^-]*-g\)/r\1/;s/-/./g' <<< "$v")
  else
    v=r$(git -C "$theme" rev-list --count HEAD).g$(git -C "$theme" rev-parse --short=7 HEAD)
  fi
  printf '%s.f%s.%s' "$v" "$(git -C "$fixes" rev-list --count HEAD -- generic "${_fixes}")" \
    "$(git -C "$fixes" log -1 --format=%h --abbrev=7 HEAD -- generic "${_fixes}")"
}

prepare() {
  local fx="$srcdir/gtk-theme-fixes"
  if [[ ${local_build:-} == true ]]; then
    local d
    d=$(_local_fixes) || return 1
    warning "local_build: fixes from $d (uncommitted changes included)"
    rm -rf "$fx" && mkdir "$fx"
    cp -r "$d/generic" "$d/${_fixes}" "$fx/"
  fi
  cd "${_name}"

  local sass=src/_sass
  cp "$fx/generic/fixes-3.0.scss" "$sass/_fixes-3.0.scss"
  cp "$fx/generic/fixes-4.0.scss" "$sass/_fixes-4.0.scss"
  cp "$fx/${_fixes}/fixes-variables.scss" "$sass/_variables-fix.scss"
  cp "$fx/${_fixes}/local-fixes-3.0.scss" "$sass/_local-fixes-3.0.scss"
  cp "$fx/${_fixes}/local-fixes-4.0.scss" "$sass/_local-fixes-4.0.scss"

  # the fixes are imported near the end of each GTK entry file, after the theme's own partials,
  # so they see its variables
  local f
  for f in src/gtk/3.0/*.scss; do
    sed -i "$(awk 'END { print NR - 1 }' "$f") a @import '../../_sass/fixes-3.0';" "$f"
    sed -i "$(awk 'END { print NR - 1 }' "$f") a @import '../../_sass/local-fixes-3.0';" "$f"
    sed -i "$(awk 'END { print NR - 6 }' "$f") a @import '../../_sass/variables-fix';" "$f"
  done
  for f in src/gtk/4.0/*.scss; do
    sed -i "$(awk 'END { print NR - 1 }' "$f") a @import '../../_sass/fixes-4.0';" "$f"
    sed -i "$(awk 'END { print NR - 1 }' "$f") a @import '../../_sass/local-fixes-4.0';" "$f"
    sed -i "$(awk 'END { print NR - 6 }' "$f") a @import '../../_sass/variables-fix';" "$f"
  done
}

package() {
  cd "${_name}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -d "${pkgdir}/usr/share/themes"
  # every accent, Dracula colors, 12px corners
  # TERM: install.sh draws a spinner with tput, which fails without one (clean chroots)
  TERM=${TERM:-dumb} ./install.sh -t all --tweaks dracula --round 12px -d "${pkgdir}/usr/share/themes"
}
