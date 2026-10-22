# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=katiecad-git
_pkgname=katiecad
pkgver=0.2.2.r0.g0000000
pkgrel=1
pkgdesc="Lightweight CAD drawing tool (Python/Tkinter) with DXF/DWG support"
arch=('any')
url="https://github.com/Merecete/KatieCAD"
license=('MIT')
depends=('python' 'tk' 'python-pillow' 'python-ezdxf')
optdepends=(
  'python-ezdwg: extended DWG import (pip: python -m pip install ezdwg)'
  'oda-file-converter: DWG conversion via ODA File Converter'
  'libredwg: DWG conversion via dwg2dxf'
)
makedepends=('git' 'python')
provides=('katiecad')
conflicts=('katiecad')
source=("git+https://github.com/Merecete/KatieCAD.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/KatieCAD"
  ver=$(python -c 'from katiecad_manifest import VERSION; print(VERSION)' 2>/dev/null || echo "0.2.2")
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/KatieCAD"
  install -d "$pkgdir/usr/share/katiecad"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/pixmaps"
  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -d "$pkgdir/usr/share/metainfo"

  install -m644 KatieCAD.py katiecad_*.py requirements.txt README.md "$pkgdir/usr/share/katiecad/"

  # Launcher: prefer the wrapper shipped in packaging/ (after upstream
  # merges the installers PR), otherwise generate an equivalent one.
  if [[ -f packaging/katiecad ]]; then
    install -m755 packaging/katiecad "$pkgdir/usr/bin/katiecad"
  else
    cat > "$pkgdir/usr/bin/katiecad" <<'EOF'
#!/bin/sh
set -e
exec python3 /usr/share/katiecad/KatieCAD.py "$@"
EOF
    chmod 0755 "$pkgdir/usr/bin/katiecad"
  fi

  # Desktop entry: same fallback logic.
  if [[ -f packaging/katiecad.desktop ]]; then
    install -m644 packaging/katiecad.desktop "$pkgdir/usr/share/applications/katiecad.desktop"
  else
    cat > "$pkgdir/usr/share/applications/katiecad.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=KatieCAD
GenericName=CAD Drawing Tool
Comment=Lightweight CAD drawing tool with DXF/DWG support
Exec=katiecad %F
Icon=katiecad
Terminal=false
Categories=Graphics;Engineering;2DGraphics;
StartupWMClass=KatieCAD
EOF
    chmod 0644 "$pkgdir/usr/share/applications/katiecad.desktop"
  fi

  install -m644 KatieCAD.png "$pkgdir/usr/share/pixmaps/katiecad.png"
  install -m644 KatieCAD.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/katiecad.png"
  if [[ -f packaging/katiecad.appdata.xml ]]; then
    install -m644 packaging/katiecad.appdata.xml "$pkgdir/usr/share/metainfo/katiecad.appdata.xml"
  fi
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  python -m compileall -q "$pkgdir/usr/share/katiecad" || true
  find "$pkgdir" -name '__pycache__' -type d -prune -exec rm -rf {} + 2>/dev/null || true
}
