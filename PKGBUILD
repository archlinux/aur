# Maintainer: xiota / aur.chaotic.cx
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

_pkgname="skippy-xd"
pkgname="$_pkgname-git"
pkgver=2024.12.26.r105.ga6b6dd6
pkgrel=1
pkgdesc="A full-screen Exposé-style task switcher for X11"
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
  sed -E 's&^(\s*version:).*$&\1 '"'- $pkgver - AUR Edition',&" -i "$_pkgsrc/meson.build"
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
