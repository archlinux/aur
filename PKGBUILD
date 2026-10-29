# Maintainer: gaou-piou <i dot am dot piou at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mactahoe-gtk-theme-fixed-git
_name=mactahoe-gtk-theme
pkgver=2026.09.10.r7.g1e45e19.f13.fd98304
pkgrel=1
pkgdesc='MacTahoe GTK theme, with GTK 3/4 geometry fixes (window buttons, headerbars, Nautilus, Electron/Chromium titlebars)'
arch=('any')
url='https://github.com/vinceliuice/MacTahoe-gtk-theme'
license=('MIT')
depends=('gnome-themes-extra' 'gtk3')
makedepends=('git' 'gnome-shell' 'sassc')
optdepends=('gtk-engine-murrine: GTK 2 support')
provides=("${_name}")
conflicts=("${_name}" "${_name}-git")
options=('!strip' '!debug')
install="${_name}-fixed.install"
source=("${_name}::git+${url}.git")
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

# <theme version>.f<fixes commit count>.<fixes commit>
pkgver() {
  local fixes="$srcdir/gtk-theme-fixes"
  if [[ ${local_build:-} == true ]]; then
    fixes=$(_local_fixes) || return 1
  fi
  printf '%s.f%s.%s' \
    "$(git -C "$srcdir/${_name}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')" \
    "$(git -C "$fixes" rev-list --count HEAD)" "$(git -C "$fixes" rev-parse --short=7 HEAD)"
}

prepare() {
  local fixes="$srcdir/gtk-theme-fixes"
  if [[ ${local_build:-} == true ]]; then
    local d
    d=$(_local_fixes) || return 1
    warning "local_build: fixes from $d (uncommitted changes included)"
    rm -rf "$fixes" && mkdir "$fixes"
    cp -r "$d/generic" "$d/mactahoe" "$fixes/"
  fi
  cd "${_name}"

  local sass=src/sass
  cp "${fixes}/generic/fixes-3.0.scss" "${sass}/_fixes-3.0.scss"
  cp "${fixes}/generic/fixes-4.0.scss" "${sass}/_fixes-4.0.scss"
  cp "${fixes}/mactahoe/fixes-variables.scss" "${sass}/_fixes-variables.scss"
  cp "${fixes}/mactahoe/local-fixes-4.0.scss" "${sass}/_local-fixes-4.0.scss"

  # install.sh also copies its gnome-theme-switcher app to /usr/bin as root (fakeroot counts),
  # outside $pkgdir: leave it out
  sed -i '/^  install_app$/d' install.sh

  # Firefox fixes (tweaks.sh -f copies customChrome.css into the profile)
  cat "${fixes}/mactahoe/local-fixes-firefox.css" >> other/firefox/customChrome.css

  # tweaks.sh -f has no alt option: use the alt titlebuttons to match install.sh -a alt
  sed -i -E 's|@import "parts/titlebutton-(light\|dark)\.css";|@import "parts/titlebutton-\1-alt.css";|' \
    other/firefox/MacTahoe/theme*.css

  # what tweaks.sh -e was used for: rounded maximized window and system icons
  sed -i -E 's|^/\*(@import "MacTahoe/(rounded-window-maximized\|system-icons)\.css";)|\1|' \
    other/firefox/userChrome*.css

  # the fixes are imported near the end of each GTK entry file, after the theme's own partials,
  # so they see its variables
  local f
  for f in src/main/gtk-3.0/*.scss; do
    sed -i "$(awk 'END { print NR - 6 }' "$f") a @import '../../sass/fixes-variables';" "$f"
    sed -i "$(awk 'END { print NR - 2 }' "$f") a @import '../../sass/fixes-3.0';" "$f"
  done
  for f in src/main/gtk-4.0/*.scss; do
    sed -i "$(awk 'END { print NR - 6 }' "$f") a @import '../../sass/fixes-variables';" "$f"
    sed -i "$(awk 'END { print NR - 1 }' "$f") a @import '../../sass/fixes-4.0';" "$f"
    sed -i "$(awk 'END { print NR - 1 }' "$f") a @import '../../sass/local-fixes-4.0';" "$f"
  done
}

package() {
  cd "${_name}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  install -d "${pkgdir}/usr/share/themes"
  # solid, every accent, alt (macOS-style) window buttons, GNOME Shell theme with a smaller font,
  # rounded maximized windows
  # TERM: install.sh draws a spinner with setterm/tput, which fail without one (clean chroots)
  TERM=${TERM:-dumb} ./install.sh -o solid -t all -a alt --shell -smallerfont --roundedmaxwindow \
    -d "${pkgdir}/usr/share/themes"

  # Firefox theme: tweaks.sh -f needs only these; each user installs it with mactahoe-firefox-theme
  local share="${pkgdir}/usr/share/${_name}"
  install -d "${share}/other"
  cp -r tweaks.sh libs "${share}"
  cp -r other/firefox "${share}/other"
  # -f never needs the sass options, and src/ is not shipped: drop the unconditional call
  sed -i '/^  customize_theme$/d' "${share}/tweaks.sh"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mactahoe-firefox-theme" <<EOF
#!/bin/sh
exec /usr/share/${_name}/tweaks.sh -f "\$@"
EOF
}
