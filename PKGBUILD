# Maintainer: aur.chaotic.cx
# Contributor: Christian Boxdörfer <christian.boxdoerfer@posteo.de>

_pkgname="fsearch"
pkgname="$_pkgname"
pkgver="0.3.1"
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
  'glib2-devel'
  'itstool'
  'meson'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/$pkgver.$_pkgext"
  '0001-fix_new_window.patch'
)
sha256sums=(
  'b16ab75556d841bf858633710d71c92f35d34362614b8584b0a5b71690a72c39'
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

build() {
  local _meson_options=(
    -Dchannel=AUR-stable
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
