# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=airhockey-git
_pkgname=airhockey
pkgver=r38.bfa266b
pkgrel=2
pkgdesc="Single- and multi-player air hockey game written in OpenGL"
arch=('x86_64')
url="https://github.com/cosmiczilch/AirHockey"
license=('unknown')  # upstream ships no license
depends=('glu' 'hicolor-icon-theme' 'libgl' 'sdl12-compat' 'sdl_image' 'sdl_mixer' 'sdl_net')
# glew: linked by makefile, but dropped by --as-needed; imagemagick: icon generation
makedepends=('git' 'glew' 'imagemagick')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/cosmiczilch/AirHockey.git"
        'airhockey.desktop')
sha256sums=('SKIP'
            '8fd2b85092453948612432716c56b28f59c3e5cd4c2c2ef9a9080fd9d702159e')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  # upstream makefile hardcodes CXXFLAGS (incl. libs), so pass build flags via CXX
  make CXX="${CXX:-g++} $CXXFLAGS $LDFLAGS"

  # upstream has no icon; cut the mallet and puck out of the main menu background
  local size
  for size in 48 64 128 256; do
    magick resources/images/mainMenu_background.png -crop 800x780+20+0 +repage \
      -gravity center -background none -extent 800x800 -resize ${size}x${size} \
      "$srcdir/icon-$size.png"
  done
}

package() {
  cd "$_pkgname"
  install -Dm755 main "$pkgdir/usr/lib/$_pkgname/airhockey"
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -r --no-preserve=ownership,mode resources "$pkgdir/usr/share/$_pkgname/"

  # game loads its resources relative to the current directory
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/airhockey" <<EOF
#!/bin/sh
cd /usr/share/$_pkgname || exit 1
exec /usr/lib/$_pkgname/airhockey "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/airhockey"

  local size
  for size in 48 64 128 256; do
    install -Dm644 "$srcdir/icon-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/airhockey.png"
  done
  install -Dm644 "$srcdir/airhockey.desktop" "$pkgdir/usr/share/applications/airhockey.desktop"
}

# vim: sw=2:ts=2 et:
