# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-dora-search
_gitpkgname=dora
pkgver=0.1.12
pkgrel=2
pkgdesc='Dora The Explorer, a friendly experiment manager'
arch=('any')
url='https://github.com/facebookresearch/dora'
license=('MIT')
depends=(
  'ipython'
  'python'
  'python-hydra-colorlog'
  'python-hydra-core'
  'python-omegaconf'
  'python-pytorch'
  'python-pytorch-lightning'
  'python-retrying'
  'python-submitit'
  'python-treetable'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
optdepends=(
  'python-hiplot: for HiPlot integration'
  'python-torchvision: to use the included examples'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/facebookresearch/dora/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '6fca5f81ef2c6e775958c5b443ff1c570dfc5577652f54cffeb38c1c953344e8ae4f3ec8a20b51729cf17acd5ff69720397c552123cc436e8e4bfd48c073ce9f'
)

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  python -m installer --destdir=tmp_install dist/*.whl

  echo >&2 'Running unit tests'
  export PATH="${PWD}/tmp_install/usr/bin:${PATH}"
  export PYTHONPATH="${PWD}/tmp_install/${_site_packages}"
  # Exclude tests that assume to live in a Git repository
  pytest -k 'not git_save and not shep'
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    examples

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
