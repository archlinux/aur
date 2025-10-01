# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-llm-anthropic
_gitpkgname=llm-anthropic
pkgver=0.19
pkgrel=1
pkgdesc='LLM plugin for models hosted by Anthropic, including the Claude series'
arch=('any')
url='https://github.com/simonw/llm-anthropic'
license=('Apache-2.0')
depends=(
  'python'
  'python-click'
  'python-httpx'
  'python-llm'
  'python-ijson'
  'python-pydantic'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-inline-snapshot'
  'python-pytest'
  'python-pytest-recording'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-anthropic/archive/${pkgver}.tar.gz"
)

sha512sums=('dac98a432f216d4ca5567fe7ab5fc34c4f4566bd8e7387a7385806e318ed1daa844d153dad701a778578f400de9bf051b3c902aded819470e6c0e68f6244cb16')

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  echo >&2 'Running unit tests'
  test-env/bin/python -m pytest
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
