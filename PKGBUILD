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

makedepends=('npm' 'python-virtualenv' 'nodejs' 'base-devel')

source=("https://github.com/Kruptein/PlanarAlly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc73bfc68b8e5bdfe1c5d8ab7165a8171ab48c7a7ece34aede7827a501e00e80')

package() {
  install -dm755 "$pkgdir/usr/lib/planarally"
  cp -r "$srcdir/PlanarAlly-$pkgver"/* "$pkgdir/usr/lib/planarally/"
  
  # CRITICAL: Config + data dirs
  install -dm755 "$pkgdir/usr/lib/planarally/server/config"
  install -dm755 "$pkgdir/usr/lib/planarally/server/data"
  touch "$pkgdir/usr/lib/planarally/server/data/planar.sqlite"
  
  # Perfect wrapper (already correct)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/planarally" << 'EOF'
#!/bin/bash
cd /usr/lib/planarally
exec python3 server/planarally.py "\$@"
EOF
}

