# Maintainer:
# Contributor: Christian Boxdörfer <christian.boxdoerfer@posteo.de>

_pkgname="fsearch"
pkgname="$_pkgname-git"
pkgver=0.2.3.r294.g92caee8
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

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag _version _revision _hash
  _tag=$(git tag | grep -Ev '[A-Za-z][A-Za-z]|^v' | sort -rV | head -1)
  _version="${_tag:?}"
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _meson_options=(
    -Dchannel=AUR-devel
  )

  arch-meson "${_meson_options[@]}" "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
