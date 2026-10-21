# Maintainer:
# Contributor: Christian Boxdörfer <christian.boxdoerfer@posteo.de>

_pkgname="fsearch"
pkgname="$_pkgname-git"
pkgver=0.3.r91.gc20e6b1
pkgrel=1
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
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

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
