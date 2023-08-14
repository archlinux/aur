# Maintainer:
# Contributor: David Garfias <jose.garfias@ingenieria.unam.edu>
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_gitname="vte"
_pkgname="vte3"
pkgname="$_pkgname-git"
pkgver=0.75.0.r2.g2066534d
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget (GTK3)"
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

  'vte-git'
  'vte-common-git'
  'vtethree-git'
)
conflicts=(
  'vte3'
  'vte-common'

  'vte-git'
  'vte-common-git'
  'vtethree-git'
)

source=(
  "$_gitname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_gitname"

  _regex="^\s+version:\s+'([0-9]+\\.[0-9]+\\.[0-9]+)',\$"
  _file='meson.build'

  _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  _version=$(
    echo "$_line" | sed -E "s@$_regex@\1@"
  )
  _commit=$(
    git log -G "$_line" -1 --pretty=oneline --no-color | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count $_commit..HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  printf '%s.r%s.g%s' \
    "$_version" \
    "$_revision" \
    "$_hash"
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
