# Maintainer: xiota / aur.chaotic.cx
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

_pkgname="skippy-xd"
pkgname="$_pkgname-git"
pkgver=2026.09.13.r5.gf1e95a8
pkgrel=1
pkgdesc="A full-screen task switcher for X11, similar to Overview and Exposé"
url="https://github.com/felixfung/skippy-xd"
license=("GPL-2.0-or-later")
arch=("i686" "x86_64")

depends=(
  'giflib'
  'libjpeg-turbo'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxft'
  'libxinerama'
)
makedepends=(
  'cmake'
  'git'
  'meson'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

backup=('etc/xdg/skippy-xd.rc')

_pkgsrc="felixfung.skippy-xd"
_pkgsrc_chipmunk="chipmunk"
source=(
  "$_pkgsrc"::"git+$url.git"
  "$_pkgsrc_chipmunk"::"git+https://codeberg.org/slembcke/Chipmunk2D.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # set version for AUR Edition
  echo "- $pkgver - AUR Edition" > "$_pkgsrc/version.txt"

  # subprojects
  ln -sf "$srcdir/$_pkgsrc_chipmunk" "$_pkgsrc/subprojects/chipmunk2d"
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
