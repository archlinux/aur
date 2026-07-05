# Maintainer: MapleProjects <rickstyles@protonmail.com>
pkgname=forsaken-autocomplete-linux
pkgver=0.1.0
pkgrel=1
pkgdesc="Auto-solver for Forsaken (Roblox) Numberlink puzzles — Linux edition"
arch=('x86_64')
url="https://github.com/MapleProjects/ForsakenAutoComplete-Linux"
license=('MIT')
depends=('python' 'python-opencv' 'python-numpy' 'python-pillow' 'python-evdev'
         'python-platformdirs' 'ydotool' 'grim' 'xdg-utils')
makedepends=('git')
provides=('forsaken-autocomplete-linux')
conflicts=()
source=('git+https://github.com/MapleProjects/ForsakenAutoComplete-Linux.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ForsakenAutoComplete-Linux"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/ForsakenAutoComplete-Linux"

  # Install app files to /usr/share/forsaken-autocomplete/
  install -dm755 "$pkgdir/usr/share/forsaken-autocomplete"
  cp -r flow_solver.py core/ platforms/ assets/ "$pkgdir/usr/share/forsaken-autocomplete/"

  # Install icon
  install -Dm644 assets/ForsakenAC.png "$pkgdir/usr/share/pixmaps/forsaken-autocomplete.png"

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/forsaken-autocomplete.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Forsaken AutoComplete
Comment=Auto-solver for Forsaken Numberlink puzzles
Exec=/usr/bin/forsaken-autocomplete
Icon=forsaken-autocomplete
Terminal=true
Type=Application
Categories=Game;
DESKTOP

  # Wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/forsaken-autocomplete" << 'WRAPPER'
#!/bin/sh
exec python3 /usr/share/forsaken-autocomplete/flow_solver.py "$@"
WRAPPER
}
