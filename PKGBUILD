# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(
  freetype2-git
  freetype2-demos-git
)
pkgver=2.14.0+p0+g007c46ebb
pkgrel=2
epoch=1
pkgdesc="Font rasterization library (from git)"
url="https://www.freetype.org/"
arch=(x86_64)
license=('FTL OR GPL-2.0-or-later')
depends=(
  brotli
  bzip2
  glibc
  libpng
  zlib
)
makedepends=(
  cairo
  gcc-libs
  git
  glib2
  harfbuzz
  librsvg
  libx11
  meson
  qt5-base
)
source=(
  git+https://gitlab.freedesktop.org/freetype/freetype.git
  git+https://gitlab.freedesktop.org/freetype/freetype-demos.git
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-long-PCF-family-names.patch
  freetype2.sh
)
b2sums=('SKIP'
        'SKIP'
        'f45ec7d03193b446d8b46c8d981f330843a1ab2c83a91a5011cb328b26b4fc4c4b5729f32f3270018cf5ba8a162712bd0ebc2cd67f97b906e46ce293aeda466f'
        'b9481bfe770104b181a59be8cf30c90d329447d3ba04bd7dc641a54057cf2a9024c1a881d096b7ff940e9b467960ff3e08e611686d9a01136523fbb34299d057'
        '1ced8e4ef522b111759953f6b4b38864b1a705e5b6705222282b0e6857a4ee7ac8bdcec35248f53dd8b628fabb8861ee82c4ac957f4c71229bac94d8aaf82984'
        'a964f46886b5017a5c180f29408f72ae8aba29f37404c48b4681ff12ca0a2cfa2a8e219480e98d63d45fb5c266a6e5826df170c9a0d701cd866e395c5ac6e87d')
validpgpkeys=(
  E30674707856409FF1948010BE6C3AAC63AD8E3F # Werner Lemberg <wl@gnu.org>
)

pkgver() {
  local _tag _count

  cd freetype
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count $_tag..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+p$_count+g$(git rev-parse --short HEAD)
}

prepare() {
  # Build FreeType as part of the demos
  ln -sr freetype freetype2

  git -C freetype apply -3 < 0001-Enable-table-validation-modules.patch
  git -C freetype apply -3 < 0002-Enable-subpixel-rendering.patch
  git -C freetype apply -3 < 0003-Enable-long-PCF-family-names.patch
}

build() {
  local meson_options=(
    -D freetype2:default_library=shared
    -D freetype2:error_strings=true
    -D freetype2:harfbuzz=dynamic
  )

  # Build FreeType as part of the demos
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson freetype-demos build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_freetype2-git() {
  optdepends=(
    'harfbuzz: Improved autohinting'
  )
  provides=(
    libfreetype.so
    "freetype2=$pkgver"
  )
  conflicts=(freetype2)
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  meson install -C build --destdir="$pkgdir"

  _pick demos "$pkgdir"/usr/bin
  _pick demos "$pkgdir"/usr/share/man/man1

  install -Dm644 freetype2.sh -t "$pkgdir/etc/profile.d"

  install -Dm644 freetype/docs/FTL.TXT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_freetype2-demos-git() {
  pkgdesc="Freetype tools and demos (from git)"
  depends=(
    cairo
    freetype2-git
    gcc-libs
    glib2
    glibc
    librsvg
    libx11
  )
  optdepends=('qt5-base: ftinspect')
  provides=("freetype2-demos=$pkgver")
  conflicts=(freetype2-demos)

  mv demos/* "$pkgdir"

  install -Dm644 freetype/docs/FTL.TXT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
