# Maintainer: envolution
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libxml2-2.13
pkgver=2.13.8
pkgrel=1
pkgdesc="XML C parser and toolkit (legacy 2.13 branch, relocatable under /opt)"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(bash glibc icu readline xz zlib)
makedepends=(git meson python)
optdepends=('python: Python bindings')
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
  ln -sf ../xmlconf

  git cherry-pick -n c2e2d76211e27df3c882616a14b4da24df7d3cb3 || true
  git cherry-pick -n 064a02114a0e35ac9d87dd1a0952e6c474273a68 || true
  patch -Np1 -i ../0001-meson-Install-a-xml2-config-script.patch || true
  patch -Np1 -i ../0002-meson-Build-fixes.patch || true
}

build() {
  local meson_options=(
    -Dprefix=/opt/$pkgname
    --libexecdir lib
    --sbindir bin
    --buildtype plain
    --auto-features enabled
    --wrap-mode nodownload
    -D b_pie=true
    -D python.bytecompile=1
    -Dincludedir=include
    -D history=true
    -D http=true
    -D legacy=true
    -D python=true
  )

  meson libxml2 build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Move license
  install -Dm644 libxml2/Copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/lib"
  # Add compatibility symlink for legacy binaries
  ln -s /opt/libxml2-2.13/lib/libxml2.so.2 "$pkgdir/usr/lib/libxml2.so.2"
}

# vim:set ts=2 sw=2 et:
