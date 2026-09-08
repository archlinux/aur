# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'python-nab'
  'python-nab-index'
  'python-nab-markersets'
  'python-nab-project'
  'python-nab-provider'
  'python-nab-resolver'
)
pkgbase=python-nab
_name=${pkgbase#python-}
pkgver=0.0.17
pkgrel=1
pkgdesc="PubGrub-based dependency resolver for Python packages."
arch=('any')
url="https://github.com/notatallshaw/nab"
license=('MIT')
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
source=("${_name}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6932c9dab830d60adfa98f5cc4da4dee90db6bf31f1a8c0e7e2962163d6592ff')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation

  _modules=(
    "${_name}-index"
    "${_name}-markersets"
    "${_name}-project"
    "${_name}-provider"
    "${_name}-resolver"
  )
  for _module in ${_modules[*]}; do
    pushd "${_module}"
    python -m build --wheel --no-isolation
    popd
  done
}

package_python-nab() {
  depends=(
    'python-nab-index'
    'python-nab-markersets'
    'python-nab-project'
    'python-nab-provider'
    'python-nab-resolver'
    'python-tomli'
    'python-typing_extensions'
  )

  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-nab-index() {
  pkgdesc="PyPI Simple-API client and on-disk cache for nab"
  depends=(
    'python-packaging'
    'python-nab-provider'
    'python-truststore'
    'python-typing_extensions'
    'python-urllib3'
  )
  optdepends=('python-httpx')

  cd "${_name}-$pkgver/${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-nab-markersets() {
  pkgdesc="PEP 508 marker algebra: markers as sets of environments"
  depends=(
    'python-packaging'
    'python-typing_extensions'
  )

  cd "${_name}-$pkgver/${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-nab-project() {
  pkgdesc="Index-backed provider, lockfile emitter, and downloader for nab"
  depends=(
    'python-build'
    'python-installer'
    'python-nab-index'
    'python-nab-markersets'
    'python-nab-provider'
    'python-nab-resolver'
    'python-packaging'
    'python-pyproject-hooks'
    'python-tomli'
    'python-tomli-w'
    'python-typing_extensions'
  )
  conflicts=('python-nab-python')

  cd "${_name}-$pkgver/${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-nab-provider() {
  pkgdesc="IO-free resolution core for nab"
  depends=(
    'python-nab-markersets'
    'python-nab-resolver'
    'python-typing_extensions'
  )
  conflicts=('python-nab-python')

  cd "${_name}-$pkgver/${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-nab-resolver() {
  pkgdesc="Generic PubGrub dependency-resolver core"
  depends=('python-typing_extensions')

  cd "${_name}-$pkgver/${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
