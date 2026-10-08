# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-pip-audit
pkgver=2.10.1
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/pypa/pip-audit'
license=('Apache-2.0')
depends=(
  'python'
  'python-cachecontrol'
  'python-cyclonedx-lib'
  'python-packaging'
  'python-pip-api'
  'python-pip-requirements-parser'
  'python-platformdirs'
  'python-requests'
  'python-rich'
  'python-tomli'
  'python-tomli-w'
)
checkdepends=('git' 'python-pretend' 'python-pytest')
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
  'python-pyproject-patcher'
)
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pypa/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8b448b994afad72e55b3b5ea60ea8733887a7e259c625b4df91fd27f7e6ff6f781e1074a04d646245b50c143c97ac43541beafa9fdc064d2d9db4d8b772fd4cf')

prepare() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"

  echo >&2 'Stripping overly strict version requirements'
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.build_system_requires.strip_constraint('flit_core')
EOF
}

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
