# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'python-nab'
  'python-nab-index'
  'python-nab-python'
  'python-nab-resolver'
)
pkgbase=python-nab
_name=${pkgbase#python-}
pkgver=0.0.13
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
sha256sums=('80ceb2371ab767dcab9902db55601e95f4efbd92f8303593b304dff26f8bf4e3')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation

  for _module in nab-index nab-python nab-resolver; do
    pushd ${_module}
    python -m build --wheel --no-isolation
    popd
  done
}

package_python-nab() {
  depends=(
    'python-nab-index'
    'python-nab-python'
    'python-nab-resolver'
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
    'python-truststore'
    'python-typing_extensions'
    'python-urllib3'
  )
  optdepends=('python-httpx')

  cd "${_name}-$pkgver/${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-nab-python() {
  pkgdesc="Index-backed provider, lockfile emitter, and downloader for nab"
  depends=(
    'python-build'
    'python-installer'
    'python-pyproject-hooks'
    'python-tomli'
    'python-tomli-w'
    'python-typing_extensions'
    'python-nab-index'
    'python-nab-resolver'
  )

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
