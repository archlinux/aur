# Maintainer: Soapton <soapton@planarally.local>
pkgname=planarally-bin
pkgver=2026.1.2
pkgrel=2
pkgdesc="PlanarAlly v${pkgver} - tabletop companion for virtual tabletops"
arch=('x86_64')
url='https://www.planarally.io'
license=('MIT')

depends=(
  'nodejs' 'npm' 'git' 'python' 'python-aiohttp' 'python-bcrypt'
  'python-cryptography' 'python-email-validator' 'python-jinja'
  'python-peewee' 'python-pillow' 'python-pydantic' 'python-rtoml'
  'python-socketio' 'python-typing_extensions' 'python-watchdog'
)

makedepends=('npm')

source=("https://github.com/Kruptein/PlanarAlly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd PlanarAlly-${pkgver}
}

package() {
  cd PlanarAlly-${pkgver}
  
  # Copy EVERYTHING
  install -dm755 "$pkgdir/usr/lib/planarally"
  cp -r . "$pkgdir/usr/lib/planarally/"
  rm -rf "$pkgdir/usr/lib/planarally/.git"
  
  # Writable dirs
  install -dm755 "$pkgdir/usr/lib/planarally/server/static/assets"
  install -dm755 "$pkgdir/usr/lib/planarally/server/static/fonts"
  
  # Executable
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/planarally/server/planarally.py "$pkgdir/usr/bin/planarally"
  
  # Git init (REQUIRED)
  cd "$pkgdir/usr/lib/planarally/server"
  git init >/dev/null 2>&1
  git config user.name "Soapton" >/dev/null 2>&1
  git config user.email "soapton@planarally.local" >/dev/null 2>&1
  echo "# PlanarAlly" > README.md
  git add README.md >/dev/null 2>&1
  git commit -m "Initial" >/dev/null 2>&1
  git tag -a v${pkgver} -m "Release" >/dev/null 2>&1
  
  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('bc73bfc68b8e5bdfe1c5d8ab7165a8171ab48c7a7ece34aede7827a501e00e80')
