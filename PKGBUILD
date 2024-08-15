# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(
  freetype2-git
  freetype2-demos-git
)
pkgver=2.13.3+p1+gc4e6791f8
pkgrel=1
epoch=1
pkgdesc="Font rasterization library (from git)"
url="https://www.freetype.org/"
arch=(x86_64)
license=('FTL OR GPL-2.0-or-later')
depends=(
  brotli
  bzip2
  libpng
  sh
  zlib

  # creates a dependency cycle harfbuzz <-> freetype, wanted by upstream
  harfbuzz
)
makedepends=(
  git
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
        'b7e3b72e2d6aed548c1762a16ee08ac47a05caf29c5d37ef03c6791e6dbd109fdfef0b246540c35e968d54f2103b70e80eccff72ac54d34224c6d064aa53d720'
        'd2b507830adf1bb9db619cd2e0bbb0dfe5b16ba7d4467ad503e954cf91715c5aa5b52b1d3865abc9841990cda56f223eb6f282d4baf7f31fd525cc90aa96b884'
        'b83a599da8eef1c39a268482db8e82f03a2c9b68850a0ec782e9839e7b45a3b0f989d997647eb55e5b18f2fe0c988e73f0ec6c4eb4c0787689f9e0213faa4320'
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

  cd freetype
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
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
    freetype2-git
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
