# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(
  freetype2-git
  freetype2-demos-git
)
pkgver=2.13.3+p68+gb1f478508
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

  # creates a dependency cycle harfbuzz <-> freetype, wanted by upstream
  harfbuzz
)
makedepends=(
  cairo
  gcc-libs
  git
  glib2
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
  0001-meson.build-Add-missing-math_dep-for-SVG-support.patch
  freetype2.sh
)
b2sums=('SKIP'
        'SKIP'
        '7ddac82b202db33450af3c8ba59f932206c998fa4706369fb6c536d9b7af5100db03b2d8c1ac5de98d54e3ef3b1262f494437c041f3343f6c9e3ed112d2d1098'
        '24af9fd7e64d4e95e0438bbc96529c6e37d8407188f3df63ecd36b1270ccd6a196545e60276207fefeb5ea786ad15712004313cbd7e11f31368fe7b930d84bbc'
        'b3946946c5f46e17339d5c24b2e54d985c410355df8dac8b35c90cef59e7fe0ed8bcac4e27f32bda9f5943495adbb25510dc22c3970c0734f408e9bf2e0aaa5b'
        '58940d2ecb793a0723767d48676ac55e32f9da313e81cd265477137736693073dc3073713a0cc7578ff1d01b22148f4dd8c3534d890c9d97491f67976e2aaad0'
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
  git -C freetype-demos apply -3 < 0001-meson.build-Add-missing-math_dep-for-SVG-support.patch
}

build() {
  local meson_options=(
    -D freetype2:default_library=shared
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
