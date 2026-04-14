pkgname=legion-gui
pkgver=0.6.0.r0.0000000
pkgrel=1
pkgdesc="Legion GUI (Sparta successor) packaged for Arch/CachyOS with compatibility fixes"
arch=('any')
url="https://github.com/hackman238/legion"
license=('GPL3')

depends=('python' 'nmap' 'qt6-base' 'python-pyqt6' 'polkit')
makedepends=('git' 'python-pip' 'python-virtualenv')

provides=('legion-gui')
conflicts=('legion' 'legion-gui-git')

source=(
  "git+https://github.com/hackman238/legion.git"
  "legion-gui.desktop"
  "legion-gui-launcher"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd legion
  printf "0.6.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd legion

  # ---- Arch/CachyOS Fixes (broken upstream imports) ----
  # BrowserOpener + MyQProcess live in app/auxiliary.py, but controller uses them without import.
  grep -q "from app\.auxiliary import BrowserOpener" controller/controller.py || \
    sed -i '1i from app.auxiliary import BrowserOpener' controller/controller.py

  grep -q "from app\.auxiliary import MyQProcess" controller/controller.py || \
    sed -i '1i from app.auxiliary import MyQProcess' controller/controller.py

  # controller uses QtCore namespace; ensure it's imported
  grep -q "^from PyQt6 import QtCore" controller/controller.py || \
    sed -i '3i from PyQt6 import QtCore' controller/controller.py
}

build() {
  cd legion
  python -m venv venv
  venv/bin/pip install -U pip wheel setuptools
  if [[ -f requirements.txt ]]; then
    venv/bin/pip install -r requirements.txt
  fi
}

package() {
  cd legion

  # App nach /opt
  install -d "$pkgdir/opt/legion-gui"
  cp -a . "$pkgdir/opt/legion-gui"

  # Wrapper: /usr/bin/legion
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/legion" <<'WRAP'
#!/usr/bin/env bash
set -euo pipefail
cd /opt/legion-gui
exec ./venv/bin/python ./legion.py "$@"
WRAP
  chmod 755 "$pkgdir/usr/bin/legion"

  # Polkit Launcher + Darkmode (X11/GTK3)
  install -m755 "$srcdir/legion-gui-launcher" "$pkgdir/usr/bin/legion-gui"

  # Desktop entry
  install -d "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/legion-gui.desktop" "$pkgdir/usr/share/applications/legion-gui.desktop"

  # Icon (SVG) aus dem Repo
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  if [[ -f "images/icons/Legion-N_128x128.svg" ]]; then
    install -m644 "images/icons/Legion-N_128x128.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/legion-gui.svg"
  elif [[ -f "images/icons/legion_medium.svg" ]]; then
    install -m644 "images/icons/legion_medium.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/legion-gui.svg"
  else
    install -d "$pkgdir/usr/share/pixmaps"
    install -m644 "images/icons/logo.png" "$pkgdir/usr/share/pixmaps/legion-gui.png"
  fi
}
