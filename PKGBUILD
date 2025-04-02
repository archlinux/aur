# Maintainer: xiota / aur.chaotic.cx
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

_pkgname="skippy-xd"
pkgname="$_pkgname-git"
pkgver=2025.02.28.r66.gaf6e2a5
pkgrel=2
pkgdesc="A full-screen task switcher for X11, similar to Overview and Exposé"
url="https://github.com/felixfung/skippy-xd"
license=("GPL-2.0-or-later")
arch=("i686" "x86_64")

depends=(
  'giflib'
  'libjpeg'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxft'
  'libxinerama'
)
makedepends=(
  'git'
  'meson'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

backup=('etc/xdg/skippy-xd.rc')

_pkgsrc="felixfung.skippy-xd"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # set version for AUR Edition
  echo "- $pkgver - AUR Edition" > "$_pkgsrc/version.txt"
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
