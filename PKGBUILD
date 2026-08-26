# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'python-nab'
  'python-nab-index'
  'python-nab-project'
  'python-nab-provider'
  'python-nab-resolver'
)
pkgbase=python-nab
_name=${pkgbase#python-}
pkgver=0.0.14
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
sha256sums=('298e1d44164f952869b354f8c148bf523aef97885233889bf3b6d9e8c0b33a9e')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation

  for _module in "${_name}-index" "${_name}-project" "${_name}-provider" "${_name}-resolver"; do
    pushd ${_module}
    python -m build --wheel --no-isolation
    popd
  done
}

package_python-nab() {
  depends=(
    'python-nab-index'
    'python-nab-project'
    'python-nab-provider'
    'python-nab-resolver'
    'python-typing_extensions'
    'python-tyro'
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

package_python-nab-project() {
  pkgdesc="Index-backed provider, lockfile emitter, and downloader for nab"
  depends=(
    'python-build'
    'python-installer'
    'python-nab-index'
    'python-nab-provider'
    'python-nab-resolver'
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
  depends=('python')

  cd "${_name}-$pkgver/${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
