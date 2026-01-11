# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-submitit
_gitpkgname=submitit
pkgver=1.5.4
pkgrel=2
pkgdesc='Python toolbox for submitting jobs to Slurm'
arch=('any')
url='https://github.com/facebookincubator/submitit'
license=('MIT')
depends=(
  'python'
  'python-cloudpickle'
  'python-ipdb'
  'python-numpy'
  'python-scikit-learn'
  'python-setuptools'
)
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'rsync'
)
optdepends=(
  'python-pytorch: to run the included example'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/facebookincubator/submitit/archive/${pkgver}.tar.gz"
)

sha512sums=('01b5f30ee9af45cefc60fc10869956d285ff6bf7a73edf1f53691ca0b048c70751c463d9db74068beb0eaefc9301490c2384b29bfff89eec4e62cad9aed3dc3d')

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Running unit tests'
  # Excluding tests:
  # - snapshot tests (they assume that they live in a Git worktree)
  # - local test setup (raises `UncompletedJobError` for unknown reasons)
  pytest -k 'not snapshot and not test_setup'
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/*

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
