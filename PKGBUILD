# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-llm-openrouter
_gitpkgname=llm-openrouter
pkgver=0.6
pkgrel=1
pkgdesc='LLM plugin for models hosted by OpenRouter'
arch=('any')
url='https://github.com/simonw/llm-openrouter'
license=('Apache-2.0')
depends=(
  'python'
  'python-click'
  'python-httpx'
  'python-llm'
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
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/simonw/llm-openrouter/archive/${pkgver}.tar.gz"
)

sha512sums=('3596a45405dc7604273b400eb06546a72cc49e33630a6443f158b883694907886a05bda812f097ae22376325abc10bd900eb0e41b18aadfd0e4cddc61ef092c2')

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
