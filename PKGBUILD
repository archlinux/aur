# Maintainer:
# Contributor: David Garfias <jose.garfias@ingenieria.unam.edu>
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_gitname="vte"
_pkgname="vte3"
pkgname="$_pkgname-git"
pkgver=0.73.0.r23.gdce7b5f0
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
arch=('x86_64')
license=('LGPL')
options=('!emptydirs')
url="https://gitlab.gnome.org/GNOME/vte"

depends=(
  'gtk3'
  'vte-common'
  'glibc'
  'pcre2'
)
makedepends=(
  'git'
  'gobject-introspection'
  'gperf'
  'gtk-doc'
  'intltool'
  'meson'
  'ninja'
  'vala'
)

provides=(
  "vte3=$pkgver"
  'libvte-2.91.so'
  'vte-common'
)
conflicts=(
  'vte-common'
  'vte3'
)

source=(
  "$_gitname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_gitname"

  _version=$(
    grep -E "^\s+version:\s+'([0-9]+\.[0-9]+\.[0-9]+)',\$" meson.build \
      | sed -E "s@^\s+version:\s+'([0-9]+\.[0-9]+\.[0-9]+)',\$@\1@"
  )
  _commit=$(
    git log -S "$_version" -1 --pretty=oneline | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count $_commit..HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  echo "$_version.r$_revision.g$_hash"
}

build() {
  arch-meson vte build \
    -D b_lto=false \
    -D sixel=true

  ninja -C build
}

check() {
  ninja test -C build
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}
