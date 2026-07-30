# Maintainer:
# Contributor: Christian Boxdörfer <christian.boxdoerfer@posteo.de>

_pkgname="fsearch"
pkgname="$_pkgname-git"
pkgver=0.3.r43.g975be2f
pkgrel=2
pkgdesc="A fast graphical file search utility"
url="https://github.com/cboxdoerfer/fsearch"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'gtk3'
  'libicuuc.so'
  'pcre2'
)
makedepends=(
  'git'
  'glib2-devel'
  'itstool'
  'meson'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  '0001-fix_new_window.patch'
)
sha256sums=(
  'SKIP'
  '66b92a2bcba6006469d8aecb94612d4f633f47800bbe502d6e2061d5218478b1'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _meson_options=(
    -Dchannel=AUR-devel
  )

  arch-meson "${_meson_options[@]}" "$_pkgsrc" build

  # update version info
  local rx_pkgver rx_version
  printf -v rx_pkgver '/\\bPACKAGE_VERSION\\b/s/"\\S+"/"%s-%s"/' "$pkgver" "$pkgrel"
  printf -v rx_version '/\\bVERSION\\b/s/"\\S+"/"%s"/' "$pkgver"
  sed -E -e "$rx_pkgver" -e "$rx_version" -i build/config.h

  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
