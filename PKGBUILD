# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>

_pkgbase=mautrix-telegram
pkgname=${_pkgbase}-git
pkgver=r1275.66917b6
pkgrel=1
pkgdesc='A Matrix-Telegram hybrid puppeting/relaybot bridge'
arch=('any')
license=('AGPL-3.0')
depends=(python-sqlalchemy python-alembic python-ruamel-yaml python-magic-git python-commonmark
  python-aiohttp python-mautrix-git python-telethon python-telethon-session-sqlalchemy python-cryptg
  python-cchardet python-aiodns python-brotli python-pillow python-moviepy python-asyncpg python-olm
  python-pycryptodome python-unpaddedbase64)
makedepends=('git')
optdepends=(
  'python-cryptg: faster crypto (native instead of pure python)'
  'python-pillow: webp <-> png conversion for stickers'
  'python-moviepy: hq thumbnails for videos'
  'python-prometheus_client: prometheus metrics'
  'python-psycopg2: postgres'
  'python-matrix-nio: end-to-bridge encryption'
)
backup=("etc/$_pkgbase/config.yaml")
install=${pkgname}.install
url='https://github.com/tulir/mautrix-telegram'
source=("git+https://github.com/tulir/mautrix-telegram.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  python setup.py build
}

prepare() {
  cd "$srcdir/$_pkgbase"
  sed -i 's/^mautrix==/mautrix>=/' requirements.txt
}

package() {
  cd "$srcdir/$_pkgbase"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 ./mautrix_telegram/example-config.yaml "$pkgdir/etc/$_pkgbase/config.yaml"
  sed -i "
    s|filename: ./$_pkgbase.log|filename: /etc/$_pkgbase/${_pkgbase}.log|g;
    s|database: sqlite:///mautrix-telegram.db|database: sqlite:////etc/mautrix-telegram/mautrix-telegram.db|g" \
    "$pkgdir/etc/$_pkgbase/config.yaml"
  install -Dm644 ./alembic.ini "$pkgdir/etc/$_pkgbase/"
  cp -r ./alembic "$pkgdir/etc/$_pkgbase/alembic"
}

