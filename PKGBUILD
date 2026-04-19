# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(
  freetype2-git
  freetype2-demos-git
)
pkgver=2.14.3+p16+ga6d486002
pkgrel=1
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
  git
  glib2
  harfbuzz
  libgcc
  librsvg
  libstdc++
  libx11
  meson
  qt6-base
)
source=(
  git+https://gitlab.freedesktop.org/freetype/freetype.git
  git+https://gitlab.freedesktop.org/freetype/freetype-demos.git
  freetype2.sh
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-long-PCF-family-names.patch
)
b2sums=('SKIP'
        'SKIP'
        'a964f46886b5017a5c180f29408f72ae8aba29f37404c48b4681ff12ca0a2cfa2a8e219480e98d63d45fb5c266a6e5826df170c9a0d701cd866e395c5ac6e87d'
        'f45ec7d03193b446d8b46c8d981f330843a1ab2c83a91a5011cb328b26b4fc4c4b5729f32f3270018cf5ba8a162712bd0ebc2cd67f97b906e46ce293aeda466f'
        '95f1117e0c411341c4874520f28c6da6ae40d13fdb39b6bc78912c0a2703d2c4487d0dff2b280a3bd93b7236aacb9c8325c359f0935461aeb54898c4906726c3'
        '3e9991bd945f74cc9d21c375decd90a2c1a56542e6e44f0f37723cd14bc96fbb5fe1e8ca3dfe59d485be69eb69d7dc98fb73d532413632f8be8c5f2cc419f938')
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
    -D freetype2:hvf=disabled
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
    glib2
    glibc
    libgcc
    librsvg
    libstdc++
    libx11
  )
  optdepends=('qt6-base: ftinspect')
  provides=("freetype2-demos=$pkgver")
  conflicts=(freetype2-demos)

  mv demos/* "$pkgdir"

  install -Dm644 freetype/docs/FTL.TXT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
