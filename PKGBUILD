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

makedepends=('npm' 'nodejs' 'python-virtualenv' 'base-devel' 'python-pip')


source=("https://github.com/Kruptein/PlanarAlly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc73bfc68b8e5bdfe1c5d8ab7165a8171ab48c7a7ece34aede7827a501e00e80')


package() {
  cd "$srcdir/PlanarAlly-$pkgver"

  install -dm755 "$pkgdir/usr/lib/planarally/server"
  install -dm755 "$pkgdir/usr/lib/planarally/server"/{config,data,static,static/{assets,temp},src,src/config}

  cp -r server/* "$pkgdir/usr/lib/planarally/server/"
  cd "$pkgdir/usr/lib/planarally/server"
  rm -rf .git

  python -m venv venv
  source venv/bin/activate
  pip install --upgrade pip
  pip install -e .

  find "$pkgdir/usr/lib/planarally" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/lib/planarally" -type f -exec chmod 644 {} +

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/planarally" << 'EOF'
#!/bin/bash
DATA_DIR="\${XDG_DATA_HOME:-\$HOME/.local/share}/planarally"
CONFIG_DIR="\${XDG_CONFIG_HOME:-\$HOME/.config}/planarally"
mkdir -p "\$DATA_DIR" "\$CONFIG_DIR" "\$DATA_DIR"/{temp,save_backups}
export PLANARALLY_DATA_DIR="\$DATA_DIR"
export PLANARALLY_CONFIG_DIR="\$CONFIG_DIR"
cd /usr/lib/planarally/server
source venv/bin/activate
exec python planarally.py "\$@"
EOF

  install -Dm644 server/favicon.ico "$pkgdir/usr/share/icons/hicolor/64x64/apps/planarally.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/planarally.desktop" << 'EOF'
[Desktop Entry]
Name=PlanarAlly
Exec=planarally
Icon=planarally
Comment=TTRPG Virtual Tabletop
Categories=Game;RolePlaying;
Type=Application
EOF
}
