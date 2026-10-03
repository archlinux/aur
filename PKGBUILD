# Maintainer: gilcu3
# Contributor: portaloffreedom

_pkgname=wolframalpha
pkgname=python-$_pkgname
pkgver=5.1.4
pkgrel=1
pkgdesc="Wolfram|Alpha 2.0 API client"
url="https://github.com/jaraco/wolframalpha"
license=("MIT")
arch=("any")
depends=(
  'python'
  'python-httpx'
  'python-jaraco.context'
  'python-more-itertools'
  'python-multidict'
  'python-xmltodict'
)
optdepends=('python-keyring: read the API key from the system keyring')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
# Upstream dropped LICENSE in 5.1.4 in favour of generating it at build time
# with coherent.licensed (not packaged), so take it from the last tag that had it.
source=(
  v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  LICENSE::https://raw.githubusercontent.com/jaraco/$_pkgname/v5.1.3/LICENSE
)
sha256sums=('c55b64de98369890e258cff1a8b67feebe39a57d5c902451455fe7027b6f66ba'
            '86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # https://github.com/coherent-oss/system/issues/22
  sed -i '/coherent.licensed/d' pyproject.toml
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
