# Maintainer: Joe Holden <jwh@zorins.us>

_pkgbase=mautrix-signal
pkgname=${_pkgbase}-git
pkgver=r55.82cbefc
pkgrel=1
pkgdesc='mautrix-signal puppeting/relaybot bridge'
arch=('any')
license=('AGPL-3.0')
depends=(python-sqlalchemy python-ruamel-yaml python-magic-git python-commonmark
  python-aiohttp python-mautrix-git python-cryptg python-cchardet python-aiodns 
  python-brotli python-pillow python-moviepy python-asyncpg python-olm python-phonenumbers
  python-pycryptodome python-unpaddedbase64 python-matrix-nio)
makedepends=('git')
backup=("etc/$_pkgbase/config.yaml")
url='https://github.com/tulir/mautrix-signal'
source=("git+https://github.com/tulir/mautrix-signal.git")
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
  install -Dm644 ./mautrix_signal/example-config.yaml "$pkgdir/etc/$_pkgbase/config.yaml"
  sed -i "s|filename: ./$_pkgbase.log|filename: /etc/$_pkgbase/${_pkgbase}.log|g;" "$pkgdir/etc/$_pkgbase/config.yaml"
}
