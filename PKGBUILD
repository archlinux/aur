# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-submitit
_gitpkgname=submitit
pkgver=1.5.3
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

sha512sums=('f00a1e9f1b6a934a8a795b2ea3dca2e51a6538005fbe26ee4dda7951163347675a999aa40f553ccf5dabd685ca20bfdcd996bfec82b1695a118373e1e1a1c893')

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
