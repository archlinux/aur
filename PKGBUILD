# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=libxml2
pkgname=(
  libxml2
  libxml2-docs
)
pkgver=2.13.6
pkgrel=3
pkgdesc="XML C parser and toolkit"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  bash
  glibc
  icu
  readline
  xz
  zlib
)
makedepends=(
  git
  meson
  python
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#tag=v$pkgver"
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
  0001-meson-Build-fixes.patch
  xml2-config
)
b2sums=('84fd36291960d78ebef4c373c15c29bf4efd17fe59174cca70bad6fe8ac73dd333cdea6ed6f577db2107991fa6b6d6fb20f7551cb640cbbfe38ff696b9a0b9ba'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be'
        '15438434f5f2fa450c3ff92b552bc3029cb1dc42e7a3d607af5690ded6e10bd0119275d447018e9083d3bf9d07c96c6c3d6b01bf69d2b6d4e5c385bbb3c74416'
        'c85651b242884d37d8f23292f3d3f475005f819975a30ab2233f3e2d0adae6ba46eab85d52e46d94940b0f01e8a411460153e8ceeb1e7449cb30c629022b5da4')

prepare() {
  cd libxml2

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf

  # Meson fixes
  git apply -3 ../0001-meson-Build-fixes.patch
}

build() {
  local meson_options=(
    -D history=true
    -D http=true
    -D legacy=true
    -D python=true
  )

  arch-meson libxml2 build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libxml2() {
  optdepends=('python: Python bindings')
  provides=(libxml2.so)

  meson install -C build --destdir "$pkgdir"
  install -D xml2-config -t "$pkgdir/usr/bin"

  # Split docs
  mkdir -p doc/usr/share
  mv "$pkgdir"/usr/share/{doc,gtk-doc} -t doc/usr/share

  install -Dm644 libxml2/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libxml2-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dm644 libxml2/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
