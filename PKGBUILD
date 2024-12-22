# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Scott Alfter <scott@alfter.us>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=amaranth
pkgver=0.4.5
pkgname="python-${_pkgname}${pkgver}"
pkgrel=2
pkgdesc="A modern hardware definition language and toolchain based on Python (formerly nMigen). Version 0.4.5."
arch=(any)
url="https://github.com/amaranth-lang/amaranth"
license=('BSD-2-Clause')
depends=('python' 'python-jinja' 'python-pyvcd')
makedepends=(
  'python-build'
  'python-installer'
  'python-jschon'
  'python-packaging'
  'python-pdm-backend'
  'python-pyproject-patcher'
  'python-wheel'
)
optdepends=('python-paramiko: for remote builds')
checkdepends=(
  'python-pytest'
  'symbiyosys-git'
  'yices'
  'yosys'
)
provides=("python-nmigen=$pkgver" "python-$_pkgname=$pkgver")
conflicts=("python-$_pkgname")
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '913c2a13274caed077dcdce61ae375ca0b35ad683dd4e615c59ea5bee69cb6b9'
)

prepare()
{
  cd "${_pkgname}-${pkgver}"
  echo >&2 'Fixing package qualifier'
  sed -i -e "s/pdm\\.backend\\._vendor\\.//" pdm_build.py

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.set_project_version_from_env('pkgver')
    toml.dynamic.remove('version')
EOF
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
