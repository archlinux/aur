# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=starsessions
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.2.1
pkgrel=3
pkgdesc="Advanced sessions for Starlette and FastAPI frameworks."
arch=('any')
url="https://github.com/alex-oleshkevich/starsessions"
license=('MIT')
depends=('python-starlette' 'python-itsdangerous')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
optdepends=('python-redis')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'mypy' 'python-fastapi' 'python-redis' 'python-httpx')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('5f8a6a7ab4b52ee543c3842fff207b12c47a4d649dabd14688f78de743032b661cdbff445349f987ca8297bf84eb209de708844232a76b45dd6fb2a0bd9f8a7a')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
  cd "${_pipname}-${pkgver}"
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest -o addopts="" || warning "Some tests failed due to redis not running currently."
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
