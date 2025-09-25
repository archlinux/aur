# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=python-llm-github-copilot
_gitpkgname=llm-github-copilot
pkgver=0.3.1
pkgrel=1
pkgdesc='A GitHub Copilot plugin for the llm CLI tool'
arch=('any')
url='https://github.com/jmdaly/llm-github-copilot'
license=('Apache-2.0')
depends=(
  'python'
  'python-httpx'
  'python-llm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-vcr'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/jmdaly/llm-github-copilot/archive/${pkgver}.tar.gz"
)

sha512sums=('1c0c780d5d5fb9f5c9086e2d0bbed6bd09e46e80dae77cd190f933590d98542fc8df5ff7cb86fa8338fa1e023ecdd17d5ef2236105efd0fedd1506794d21efad')

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

  # TODO: there is no LICENSE file in the repo
  # echo >&2 'Packaging the license'
  # install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
  #   LICENSE
}
