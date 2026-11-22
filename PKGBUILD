# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=rocksndiamonds-pits-git
_pkgname=rocksndiamonds-pits
pkgver=4.4.2.4.r50.f5c7e31
pkgrel=1
pkgdesc="Rocks'n'Diamonds with a game engine and level set for The Puzzle Pits"
arch=('x86_64' 'aarch64')
url="https://github.com/LaPingvino/rocksndiamonds-pits"
# the game: GPL-2.0-only; the level set levels/The_Puzzle_Pits (The Puzzle Pits' own files): Apache-2.0
license=('GPL-2.0-only' 'Apache-2.0')
depends=('glibc' 'hicolor-icon-theme' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'zlib'
         'rocksndiamonds-data')
makedepends=('git')
optdepends=('rocksndiamonds-contrib: more level sets')
provides=("rocksndiamonds=${pkgver%%.r*}")
conflicts=('rocksndiamonds')
source=("$_pkgname::git+$url.git"
        'rocksndiamonds-pits.desktop')
sha256sums=('SKIP'
            'b086f9654297d2dcc4095e5578d7f333b3efddd4d23c2825b99b1bfe136f835f')

pkgver() {
  cd "$_pkgname"
  # R'n'D's own version, then the commits on top of it
  printf "4.4.2.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make clean
  # the game data (graphics, sounds, music, levels) is rocksndiamonds-data's, in /usr/share/rocksndiamonds
  make BASE_PATH=/usr/share/rocksndiamonds OPTIONS="$CFLAGS -Wno-format-overflow" EXTRA_LDFLAGS="$LDFLAGS"
}

package() {
  cd "$_pkgname"
  install -Dm755 rocksndiamonds "$pkgdir/usr/bin/rocksndiamonds"
  # only the new level set: everything else in the data is upstream's, from rocksndiamonds-data
  install -d "$pkgdir/usr/share/rocksndiamonds/levels"
  cp -r --no-preserve=ownership levels/The_Puzzle_Pits "$pkgdir/usr/share/rocksndiamonds/levels/"
  install -Dm644 levels/The_Puzzle_Pits/LICENSE "$pkgdir/usr/share/licenses/$pkgname/The_Puzzle_Pits-LICENSE"
  install -Dm644 graphics/gfx_classic/icons/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/rocksndiamonds.png"
  install -Dm644 "$srcdir/rocksndiamonds-pits.desktop" "$pkgdir/usr/share/applications/rocksndiamonds.desktop"
  install -Dm644 README.md CREDITS ChangeLog -t "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a --no-preserve=ownership docs/elements "$pkgdir/usr/share/doc/$pkgname/"
}
