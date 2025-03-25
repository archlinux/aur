# Maintainer:
# Contributor: Mark Wagie <mark.wagie at proton dot me>

_pkgname="sticky"
pkgname="$_pkgname-git"
pkgver=1.24.r0.g5fa93af
pkgrel=2
pkgdesc="A sticky notes app for the Linux desktop"
url="https://github.com/linuxmint/sticky"
license=('GPL-2.0-or-later')
arch=('any')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

depends=(
  'gspell'
  'gtk3'
  'python'
  'python-gobject'
  'python-xapp'
  'xapp'
)
makedepends=(
  'git'
  'meson'
)

_pkgsrc="linuxmint.sticky"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  # Set version in About dialog
  sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" "usr/lib/$_pkgname/$_pkgname.py"

  # Fix license path
  sed -i 's|common-licenses/GPL|licenses/spdx/GPL-2.0-or-later.txt|g' \
    "usr/lib/$_pkgname/$_pkgname.py"
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
