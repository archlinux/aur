# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=python-slack-sdk
pkgver=3.31.0
pkgrel=1
pkgdesc="Slack Python SDK"
arch=(any)
url="https://slack.dev/$pkgname"
license=(MIT)
depends=(python-aiohttp python-botocore python-sqlalchemy python-websockets
         python-websocket-client)
optdepends=(python-aiodns)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-flask python-flask-sockets python-moto)
replaces=(python-slackclient)
conflicts=(python-slackclient)
source=($pkgname-$pkgver.tar.gz::https://github.com/slackapi/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('dc8d4faf774aea6e420f8ccb860416ee364d2ff1df5a913ba84cbe526cfa83b2')

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
