# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-submitit
_gitpkgname=submitit
pkgver=1.5.2
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

sha512sums=('0d91a69a84015436df2e02fb1c3752d9d191e93a6d4f7b50f7c11f07b3e645f6638b0353baa0fa275e2ce7997a36e668cf789df13c426fd55b0818e06becc920')

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
