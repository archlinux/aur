# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_pypiname=tcafe-attending-bot
_pkgname=tcafe-attending-bot
pkgname=python-${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc='Auto attending bot for TCafe'
arch=('any')
url="https://github.com/isac322/$_pkgname"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-beautifulsoup4' 'python-xdg-base-dirs')
makedepends=('python-build' 'python-flit-core' 'python-installer')
source=(
  "$_pypiname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pypiname::1}/$_pypiname/${_pypiname//-/_}-$pkgver.tar.gz"
  'tcafe-attending-bot.service'
  'tcafe-attending-bot.timer'
)
sha256sums=(
  '5f8cfb0758c0ea4c2eee1eb439cdfb17f032e9a528487d3cbe3256460024aa19'
  '31a606b3b3e1b859ec6a5ab5261e2c319b12c279c549762f717ebf61b7decf92'
  'f38b677fd6083259cce73127a307ac51bdc5599b20882362455d849868a24445'
)

build() {
  # The 1.0.0 sdist predates flit-core 4 and caps the backend at <4.
  # Arch ships flit-core 4, whose wheel output remains compatible here.
  sed -i 's/flit_core >=3.2,<4/flit_core >=3.2,<5/' \
    "${_pypiname//-/_}-$pkgver/pyproject.toml"
  cd "${_pypiname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pypiname//-/_}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  _systemdbasedir="$pkgdir/usr/lib/systemd/system"

  install -Dm644 ../tcafe-attending-bot.service "$_systemdbasedir/tcafe-attending-bot.service"
  install -Dm644 ../tcafe-attending-bot.timer "$_systemdbasedir/tcafe-attending-bot.timer"
}
