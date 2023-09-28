# Maintainer:

_pkgname="epdfview"
pkgname="$_pkgname-git"
pkgver=0.2.0.r28.g6f907bd
pkgrel=1
pkgdesc='Lightweight PDF document viewer'
url='https://github.com/Flow-It/epdfview_old'
arch=('x86_64')
license=('GPL2')

depends=(
  'gtk3'
  'hicolor-icon-theme'
  'poppler-glib'
)
makedepends=(
  'doxygen'
  'git'
  'meson'
  'ninja'
)

options=('!emptydirs')

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("$_pkgname")
  conflicts=("$_pkgname")
fi

_pkgsrc="$_pkgname"
source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgsrc"

  _regex="^\s+version:\s+'([0-9]+\\.[0-9]+\\.[0-9]+)',\$"
  _file='meson.build'

  _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  _version=$(
    printf '%s' "$_line" | sed -E "s@$_regex@\1@"
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
  local _meson_options=(
    --prefix=/usr
    --buildtype=plain
  )

  arch-meson "$_pkgsrc" build "${_meson_options[@]}"

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
