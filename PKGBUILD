# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llama-index-workflows
pkgname=python-${_name}
pkgver=2.19.1
pkgrel=1
pkgdesc="An event-driven, async-first, step-based way to control the execution flow of AI agent"
arch=('any')
url="https://github.com/run-llama/workflows-py"
license=('MIT')
depends=('python' 'python-llama-index-instrumentation' 'python-pydantic' 'python-uv-build')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'python-uv-build')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('13328139112bf0f0442e1e87a9c57d94c6f992b14d17546f58e61bcc76546850')

prepare() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    sed -i 's/uv_build>=0.9.10,<0.10.0/uv_build>=0.9.10,<=0.10.10/' pyproject.toml
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
