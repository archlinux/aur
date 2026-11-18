# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=databricks-sdk
pkgname=python-$_name
pkgver=0.168.0
pkgrel=1
pkgdesc='Databricks SDK for Python (Beta).'
arch=('any')
url='https://github.com/databricks/databricks-sdk-py'
license=('Apache-2.0')
depends=('python'
         'python-certifi'
         'python-requests'
         'python-google-auth'
         'python-protobuf'
         'python-urllib3')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-mock'
              'python-requests-mock'
              'python-pyfakefs'
              'python-openai'
              'python-langchain-openai'
              'python-httpx'
              'python-grpcio')
optdepends=('ipython: notebook'
            'python-ipywidgets: notebook'

            'python-openai: openai'
            'python-langchain-openai: openai'
            'python-httpx: openai'

            'python-protobuf: sandbox'
            'python-grpcio: sandbox')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d8ca23d27bba9de935b64d1519a8fe32846eef7e5d045c5af97f628317e3201')

prepare() {
  cd "$_name-py-$pkgver"
  # Use the setuptools version shipped by Arch
  sed -i '/^requires = /s/"setuptools[<>=!~][^"]*"/"setuptools"/' pyproject.toml
}

build() {
  cd "$_name-py-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-py-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-py-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
