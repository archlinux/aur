# Maintainer: Smoolak <smoolak@gmail.com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name1=lance-namespace
_name2=$_name1-urllib3-client
pkgbase=python-$_name1
pkgname=(python-$_name1 python-$_name2)
pkgver=0.13.0
pkgrel=2
arch=('any')
_repo="https://github.com/lance-format/lance-namespace"
license=('Apache-2.0')
depends=('python'
         'python-urllib3'
         'python-dateutil'
         'python-pydantic'
         'python-typing_extensions')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("$pkgbase-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8250cd149a3d860ac26772f37fe806c7660b8d60f35d2bab1cbdc2e8327d41f5')

build() {
  cd $_name1-$pkgver/python/${_name2//-/_}
  python -m build --wheel --no-isolation
  cd ../${_name1//-/_}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd $_name1-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer python/${_name2//-/_}/dist/*.whl
  test-env/bin/python -m installer python/${_name1//-/_}/dist/*.whl
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" python/${_name2//-/_}/test tests
}

package_python-lance-namespace-urllib3-client() {
  pkgdesc='Lance Namespace Specification.'
  url="$_repo/blob/main/python/${_name2//-/_}"
  cd $_name1-$pkgver/python/${_name2//-/_}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-lance-namespace() {
  pkgdesc='Lance Namespace interface and plugin registry.'
  depends=('python'
           'python-lance-namespace-urllib3-client')
  url="$_repo/blob/main/python/${_name1//-/_}"
  cd $_name1-$pkgver/python/${_name1//-/_}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
