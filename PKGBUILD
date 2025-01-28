# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=python-slack-sdk
pkgver=3.34.0
pkgrel=1
pkgdesc="Slack Python SDK"
arch=(any)
url="https://slack.dev/$pkgname"
license=(MIT)
depends=(python-aiohttp python-botocore python-sqlalchemy python-websockets
         python-websocket-client)
optdepends=(python-aiodns)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-flask python-flask-sockets python-moto python-pytest)
replaces=(python-slackclient)
conflicts=(python-slackclient)
source=($pkgname-$pkgver.tar.gz::https://github.com/slackapi/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('2315d19889672f15581545ce00e60fe912bc6b55263bcdff265246d30380e7b2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  test-env/bin/python -m pytest -v -k 'not test_send_message_while_disconnection'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
