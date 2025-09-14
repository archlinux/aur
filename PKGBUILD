# Maintainer:

_pkgname="annotator"
pkgname="$_pkgname-git"
pkgver=2.0.0.r18.gee5f900
pkgrel=1
pkgdesc="Image annotation for Elementary OS"
url='https://github.com/phase1geo/Annotator'
license=("GPL-3.0-or-later")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')

depends=(
  'cairo'
  'dconf'
  'gdk-pixbuf2'
  'glib2'
  'granite7'
  'graphene'
  'gtk4'
  'hicolor-icon-theme'
  'libgee'
  'libportal-gtk4'
  'libxml2'
  'pango'
)
makedepends=(
  'git'
  'meson'
  'vala'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  # fix missing headers
  sed -E -e 's&(cname = )&cheader_filename = "webp/encode.h", \1&' -i "$_pkgsrc/vapi/libwebp.vapi"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -sf "com.github.phase1geo.annotator" "$pkgdir/usr/bin/annotator"
}
