# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2.13
pkgver=2.13.8
pkgrel=1
pkgdesc="XML C parser and toolkit (2.13 version, installed to /opt with libxml.so.2 symlink)"
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
optdepends=('python: Python bindings')
provides=(libxml2.so.2)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#tag=v$pkgver"
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
  0001-meson-Install-a-xml2-config-script.patch
  0002-meson-Build-fixes.patch
)
b2sums=('81e02da9df8ca795ab48a26e2c3f6e728f6eb0d24431034cedd62b37704b23c5f2691984b0b6b2db0990db76703f4a312226bfcc3a73719d974f2d975b63a018'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be'
        '19ae53459abe55e7204ba4d196d41d31bd8a5b88a5b8c60aa9fc37b49f022d440ea15d3a5c369a043e6f539b72e05539f292d8d96eba1c7305d4875ba141dbfb'
        '9e8107be0b021f792f95bd6739865016945e42706967d42d0ae52ae5fe7d6ebf6bce65e5f2fcb6b8868508c7d007fff39fb2bf8c221e8685bc1b4b918f6e9736')

prepare() {
  cd libxml2

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf

  # Meson fixes
  git cherry-pick -n c2e2d76211e27df3c882616a14b4da24df7d3cb3
  git cherry-pick -n 064a02114a0e35ac9d87dd1a0952e6c474273a68
  git apply -3 ../0001-meson-Install-a-xml2-config-script.patch
  git apply -3 ../0002-meson-Build-fixes.patch
}

build() {
  local meson_options=(
    --prefix /opt/libxml2.13
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

package() {
  meson install -C build --destdir "$pkgdir"
  install -d "$pkgdir/usr/lib"
  ln -s /opt/libxml2.13/lib/libxml2.so.$pkgver "$pkgdir/usr/lib/libxml2.so.2"
  install -Dm644 libxml2/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
