# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>

_name=llm-ollama
pkgname="python-${_name}"
pkgver=0.15.1
pkgrel=1
pkgdesc="LLM plugin providing access to models running on an Ollama server"
arch=("any")
url="https://github.com/taketwo/llm-ollama"
license=("Apache-2.0")

depends=("python" "python-llm" "python-ollama" "python-pydantic")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
checkdepends=("python-nest-asyncio" "python-pytest-asyncio" "python-pytest-recording" "python-deepmerge")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/taketwo/llm-ollama/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c237b719911e821c95c260421e174d7c61b420e7e06df1c84ab71287b378b0d7')

build() {
  cd "${_name}-${pkgver}"

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  echo >&2 'Running unit tests'
  test-env/bin/python -m pytest
}

package() {
  cd "${_name}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -m installer --destdir="$pkgdir" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
