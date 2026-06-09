# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=pragtical
pkgver=3.12.0
pkgrel=1
pkgdesc='The practical and pragmatic code editor.'
arch=('x86_64')
url="https://github.com/pragtical/pragtical"
license=('MIT')
depends=(
  # Editor Dependencies
  'luajit' 'sdl3' 'sdl3_image' 'libiconv' 'freetype2' 'harfbuzz' 'pcre2' 'uchardet' 'hicolor-icon-theme'
  # Plugin Manager Dependencies
  'lua' 'zlib' 'mbedtls' 'libgit2' 'libzip' 'xz'
)
makedepends=('meson>=0.63')
source=(
  "https://github.com/pragtical/pragtical/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('75f1ff39387e049d3effbdca27dc3e209a2b3bace82ffffd660fac8586b49236')

build() {
  cd "pragtical-$pkgver"

  local pgo
  local lua="-Duse_system_lua=true"
  if [ -n "$PGO" ]; then
    pgo="-Db_pgo=generate"
    lua="-Duse_system_lua=false"
  fi

  local global_data
  if [ -n "$GLOBAL" ]; then
    global_data="-global"
  fi

  arch-meson --wrap-mode default --buildtype release $pgo -Db_lto=true \
    -Dstrip=true -Doptimization=3 -Drenderer_backend=sdlgpu $lua \
    build

  if [ -n "$PGO" ]; then
    meson compile -C build
    case "$XDG_SESSION_TYPE" in
      wayland|x11)
        ./scripts/run-local $global_data build run -n scripts/lua/pgo.lua
        ;;
      *)
        SDL_VIDEO_DRIVER="dummy" \
          ./scripts/run-local $global_data build run -n scripts/lua/pgo.lua
        ;;
    esac
    meson configure -Db_pgo=use build
  fi

  meson compile -C build
}

package() {
  cd "pragtical-$pkgver"
  DESTDIR="$pkgdir" meson install -C build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/pragtical/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
