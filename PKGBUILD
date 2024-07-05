# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-hydra-colorlog
_gitpkgname=hydra
pkgver=1.3.2
pkgrel=1
pkgdesc='Colored logs for Hydra logging'
arch=('any')
url='https://github.com/facebookresearch/hydra-colorlog'
license=('MIT')
depends=(
  'python'
  'python-colorlog'
  'python-hydra-core'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
optdepends=(
  'python-omegaconf: to run the included example'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/facebookresearch/hydra/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '09e700ed9ec043d6f4fc8be4475a513ccb9a7eb1bfa5f42b31785995b83c229f14191e222c445cc2de96611d42fec18e9b5c09a8da4e5c5a29b7be2e2e1cb66e'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}/plugins/hydra_colorlog"

  echo >&2 'Pinning version number'
  sed -i -e 's/\(__version__ = \).*/\1'"'${pkgver}'/" \
    hydra_plugins/hydra_colorlog/__init__.py
  sed -i \
    -e '/import read_version/d' \
    -e 's/\(version=\).*,/\1'"'${pkgver}',/" \
    setup.py
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.build_system_requires.remove_dependency('read-version')
EOF
}

build() {
  cd "${_gitpkgname}-${pkgver}/plugins/hydra_colorlog"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}/plugins/hydra_colorlog"
  pytest
}

package() {
  cd "${_gitpkgname}-${pkgver}/plugins/hydra_colorlog"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging example'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    example

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    ../../LICENSE
}
