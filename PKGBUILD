pkgname=legion-gui
pkgver=0.6.0.r690.5ec45b0
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

  # Fix: remove build-path refs ($srcdir) from venv
  if test -f "$pkgdir/opt/legion-gui/venv/pyvenv.cfg"; then
    sed -i -E "s#^prompt = .*#prompt = legion-gui#g" "$pkgdir/opt/legion-gui/venv/pyvenv.cfg" 2>/dev/null || true
    sed -i -E "s#(/[^ ]+/src/[^ ]+)#/opt/legion-gui#g" "$pkgdir/opt/legion-gui/venv/pyvenv.cfg" 2>/dev/null || true
    fi

  # Fix: drop venv console scripts that embed $srcdir in shebangs (keep python only)
  find "$pkgdir/opt/legion-gui/venv/bin" -maxdepth 1 -type f ! -name "python" ! -name "python3*" -delete 2>/dev/null || true


  # Fix: remove unicode symlink (e.g. "𝜋thon") that breaks bsdtar UTF-8 path translation

    # Cleanup: strip tests/caches/tools to reduce package size (runtime-safe)
    rm -rf "$pkgdir/opt/legion-gui/venv/lib/python3.14/site-packages/pandas/tests" 2>/dev/null || true
    rm -rf "$pkgdir/opt/legion-gui/venv/lib/python3.14/site-packages/numpy/tests" 2>/dev/null || true
    rm -rf "$pkgdir/opt/legion-gui/venv/lib/python3.14/site-packages/pip" 2>/dev/null || true
    rm -rf "$pkgdir/opt/legion-gui/venv/lib/python3.14/site-packages/setuptools" 2>/dev/null || true
    rm -rf "$pkgdir/opt/legion-gui/venv/lib/python3.14/site-packages/wheel" 2>/dev/null || true
    find "$pkgdir/opt/legion-gui/venv" -type d -name "__pycache__" -prune -exec rm -rf {} + 2>/dev/null || true
    find "$pkgdir/opt/legion-gui/venv" -type f -name "*.pyc" -delete 2>/dev/null || true

  find "$pkgdir/opt/legion-gui/venv/bin" -maxdepth 1 -type l -name "*thon" ! -name "python" ! -name "python3*" -delete 2>/dev/null || true


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
