# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-submitit
_gitpkgname=submitit
pkgver=1.5.1
pkgrel=1
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

sha512sums=(
  '3e7589d1cf017080de46b561563ea209f1279c4b8e7b40f2a360824199cb31b556446f6b243989fe3394fc5c7e4d3058580bcc482498713cdbf453f4d2f23a86'
)

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
