# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llama-index-workflows
pkgname=python-${_name}
pkgver=2.23.3
pkgrel=1
pkgdesc="An event-driven, async-first, step-based way to control the execution flow of AI agent"
arch=('any')
url="https://github.com/run-llama/workflows-py"
license=('MIT')
depends=('python' 'python-llama-index-instrumentation' 'python-pydantic' 'python-uv-build')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('fba140ea4d4aa7e7ca58f3ddc2526b92bfb31bfaf45ab2b4345401ae527061b4')

prepare() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    sed -i 's/uv_build>=0.9.10,<0.10.0/uv_build>=0.9.10,<=0.12.5/' pyproject.toml
}

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  #test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
