pkgname=planarally-bin
pkgver=2026.1.2
pkgrel=4
pkgdesc="PlanarAlly v${pkgver}"
arch=('x86_64')
url='https://www.planarally.io'
license=('MIT')

depends=(
  'python-aiohttp' 'python-bcrypt' 'python-cryptography'
  'python-email-validator' 'python-jinja' 'python-peewee'
  'python-pillow' 'python-pydantic' 'python-rtoml'
  'python-socketio' 'python-typing_extensions' 'python-watchdog'
  'nodejs' 'npm' 'git'
)

makedepends=('npm' 'python-virtualvenv' 'nodejs' 'base-devel')

source=("https://github.com/Kruptein/PlanarAlly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc73bfc68b8e5bdfe1c5d8ab7165a8171ab48c7a7ece34aede7827a501e00e80')

package() {
  cd "$srcdir/PlanarAlly-$pkgver"
  
  install -Dm755 planarally.py "$pkgdir/usr/lib/planarally/server"
  install -dm755 "$pkgdir/usr/lib/planarally/server"
  cp -r server/* "$pkgdir/usr/lib/planarally/server/"
  cd "$pkgdir/usr/lib/planarally/server"
  install -dm755 "$pkgdir/usr/lib/planarally/server"/{static/assets,static/fonts,config,templates}
  
  python -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  
  cp -r client "$pkgdir/usr/lib/planarally/" || true

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/planarally" << 'EOF'
#! /bin/bash
cd /usr/lib/planarall/server
source venv/bin/activate
exec python planarally.py "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/planarally"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/planarally.desktop" <<'EOF'
[Desktop Entry]
Name=PlanarAlly
Exec=planarally
Icon=planarally
Comment=Virtual tabletop for TTRPGs
Categories=Game;RolePlaying;
Type=Application
EOF
 install -Dm644 "$srcdir/PlanarAlly-$pkgver/server/favicon.ico"
 "$pkgdir/usr/share/icons/hicolor/64x64/apps/planarally.png"

 install -dm755 "$pkgdir/usr/share/doc/planarally"
 cat > "$pkgdir/usr/share/doc/planarally/README.md" << 'EOF'
# PlanarAlly Setup

**Server runs at:** http://localhost:8000

**Config:** Edit /usr/lib/planarally/server/config/config.toml

**Optional email support:**
pip install --user redmail

**Stop server:** Ctrl+C
EOF
 
}
