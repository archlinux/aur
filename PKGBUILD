# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=prance
pkgname=python-$_name
pkgver=26.07.19.0
pkgrel=2
pkgdesc='Resolving Swagger/OpenAPI 2.0 and 3.0.0 Parser.'
arch=('any')
url='https://github.com/RonnyPfannschmidt/prance'
license=('MITNFA')
depends=('python'
         'python-chardet'
         'python-ruamel-yaml'
         'python-requests'
         'python-packaging')
makedepends=('python-setuptools'
             'python-wheel'
             'python-setuptools-scm'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pyicu'
              'python-swagger-spec-validator'
              'python-openapi-spec-validator'
              'python-flex'
              'python-click')
optdepends=('python-pyicu: icu'

            'python-swagger-spec-validator: ssv'

            'python-openapi-spec-validator: osv'

            'python-flex: flex'

            'python-click: cli'

            'python-orjson: fast')
_openapi_commit=902e5058da8b618e5773cf86def29dd08cd18540
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "OpenAPI-Specification-$_openapi_commit.tar.gz::https://github.com/OAI/OpenAPI-Specification/archive/$_openapi_commit.tar.gz")
sha256sums=('ccd939d07ef5a0198ea67b684bebc71aa70ddea135583d25fc4d21d0a5436bfe'
            '4833f976d039f125266c80fa7611c0254a78053204d3fdba47c823c6ec89c400')

prepare() {
  cd "$_name-$pkgver"
  # Put the OpenAPI-Specification submodule the tests use in place
  rmdir tests/OpenAPI-Specification
  ln -s "$srcdir"/OpenAPI-Specification-$_openapi_commit tests/OpenAPI-Specification
}

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
  )
  cd "$_name-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
