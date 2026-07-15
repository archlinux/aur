# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=forsakenac-git
pkgver=r11.b6df9d4
pkgrel=2
pkgdesc="Auto-solver for Forsaken (Roblox) Numberlink puzzles - Linux Edition"
arch=('x86_64')
url="https://github.com/MapleProjects/ForsakenAutoComplete-Linux"
license=('MIT')
depends=('python' 'python-evdev' 'python-opencv' 'python-numpy' 'python-pillow' 'python-platformdirs' 'tk' 'grim' 'ydotool' 'wl-clipboard')
makedepends=('git')
provides=('forsakenac')
conflicts=('forsakenac')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  
  # Install files to /opt
  install -dm755 "$pkgdir/opt/forsakenac"
  cp -r *.py core/ platforms/ assets/ "$pkgdir/opt/forsakenac/"
  
  # Create launcher script (use system python explicitly)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/forsakenac" << 'LAUNCHER'
#!/bin/bash
cd /opt/forsakenac
exec /usr/bin/python3 flow_solver.py "$@"
LAUNCHER
  
  # Install icon
  install -Dm644 assets/ForsakenAC.png "$pkgdir/usr/share/pixmaps/forsakenac.png"
  
  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/forsakenac.desktop" << 'DESKTOP'
[Desktop Entry]
Type=Application
Name=ForsakenAC
GenericName=Numberlink Solver
Comment=Auto-solver for Forsaken Numberlink puzzles
Exec=forsakenac
Icon=forsakenac
Terminal=true
Categories=Game;LogicGame;
Keywords=puzzle;numberlink;forsaken;solver;
DESKTOP
}
