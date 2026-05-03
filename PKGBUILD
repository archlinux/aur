# Maintainer:  nardholio <nardholio at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Israel Herraiz <isra@herraiz.org>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>

pkgname=freeciv-sdl2
_pkgname=freeciv
pkgver=3.2.4
pkgrel=2
pkgdesc="A multiuser clone of the famous Microprose game of Civilization - SDL2 Client"
arch=('i686' 'x86_64')
url="https://www.freeciv.org"
license=('GPL')
depends=(
  'freeciv-common'
  'hicolor-icon-theme'
  'readline'
  'sdl2'
  'sdl2_gfx'
  'sdl2_image'
  'sdl2_mixer'
  'sdl2_ttf'
)
makedepends=('meson' 'python' 'git')
conflicts=('freeciv' 'freeciv-git')
options=('!libtool')

source=("git+https://github.com/freeciv/freeciv.git#tag=R${pkgver//./_}")
sha256sums=('df64b2e6aa4d6eafbcefa694ca0a7f81b6dd1d7a10a8cf82322be8f1fdd7a420')

build() {
  cd "$srcdir"/$_pkgname

  arch-meson build \
    -Dsyslua=true \
    -Dclients=sdl2 \
    -Dfcmp=[] \
    -Dtools=[]

  meson compile -C build
}

package() {
  cd "$srcdir"/$_pkgname

  # Install everything normally
  DESTDIR="$pkgdir" meson install -C build --no-rebuild

  # Files we want to keep
  local keep=(
    usr/bin/freeciv-sdl2
    usr/share/applications/org.freeciv.sdl2.desktop
    usr/share/metainfo/org.freeciv.sdl2.metainfo.xml
  )

  # Delete everything except the files we want to keep
  find "$pkgdir" -mindepth 1 -type f | while read -r file; do
    local relpath="${file#"$pkgdir"/}"
    local should_keep=0

    # Check exact matches
    for k in "${keep[@]}"; do
      if [[ "$relpath" == "$k" ]]; then
        should_keep=1
        break
      fi
    done

    # Additional check for theme files
    if [[ "$relpath" == usr/share/freeciv/themes/gui-sdl2/* ]]; then
      should_keep=1
    fi

    if (( should_keep == 0 )); then
      rm -f "$file"
    fi
  done

  # Clean up any now-empty directories
  find "$pkgdir" -mindepth 1 -type d -empty -delete
}
