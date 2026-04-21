# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=profilarr
pkgver=1.1.4
pkgrel=1
pkgdesc="Configuration Management Platform for Radarr/Sonarr"
arch=('x86_64')
url="https://github.com/Dictionarry-Hub/profilarr"
license=('AGPL-3.0-only')
depends=(
  python
  python-flask
  python-requests
  python-flask-cors
  python-aiohttp
  python-gitpython
  python-apscheduler
  python-yaml
  python-werkzeug
  python-urllib3
  python-regex
  gunicorn
)
makedepends=(npm)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz" 'profilarr.service' 'profilarr.sysusers' 'profilarr.tmpfiles')
sha256sums=('6c3b0c507149d4a7222938844fd9c9b0933189dc6f1807a8c2877d5f826910e1'
            '566462f7719b04bbfa295be7004139d1df0f15afd57347db5297238a435b01e4'
            '111c8a11133470edb6b155a5e42aec7d904176e7f633d8f1922f1b1b57daade2'
            '5e9ccf541c980e1a0742a2cf3e36338ac02430a742a7a3c4bc209a5136c9e577')

build() {
  cd "$pkgname-$pkgver"
  # Patch working dir
  sed -i -e 's/\/config/\/var\/lib\/profilarr\/config/' backend/app/config/config.py
  # Build frontend
  cd frontend
  export NG_CLI_ANALYTICS=false
  npm ci
  npm run build
}

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/webapps/profilarr"
  cp -r backend/app "$pkgdir/usr/share/webapps/profilarr/"
  cp -r frontend/dist "$pkgdir/usr/share/webapps/profilarr/app/static"
  install -Dm755 "$srcdir/profilarr.service" "$pkgdir/usr/lib/systemd/system/profilarr.service"
  install -Dm644 "$srcdir/profilarr.sysusers" "$pkgdir/usr/lib/sysusers.d/profilarr.conf"
  install -Dm644 "$srcdir/profilarr.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/profilarr.conf"
}
