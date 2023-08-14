# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Shengyu Zhang <la@archlinuxcn.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_gitname='vte'
_pkgname='vte4'
pkgname="$_pkgname-git"
pkgver=0.75.0.r2.g2066534d
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget (GTK4)"
# https://wiki.gnome.org/Apps/Terminal/VTE
url="https://gitlab.gnome.org/GNOME/vte"
arch=('x86_64')
license=('LGPL')

depends=(
  'fribidi'
  'gnutls'
  'gtk4'
  'pcre2'
  'systemd'
  'vte-common'
)
makedepends=(
  'gi-docgen'
  'git'
  'gobject-introspection'
  'gperf'
  'meson'
  'vala'
)

provides=(
  "vte4=$pkgver"
  'libvte-2.91-gtk4.so=0-64'
  'vte-git'
)
conflicts=(
  'vte4'

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
  arch-meson "$_gitname" build \
    -D b_lto=false \
    -D docs=false \
    -D gtk3=false \
    -D gtk4=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Conflict with vte-common
  rm -rf "$pkgdir"/etc/
  rm -rf "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}

  # Conflict with vte3
  rm -rf "$pkgdir/usr/share/locale/"
}

# vim:set sw=2 et:
