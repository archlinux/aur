# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=amaranth
pkgname="python-$_pkgname-git"
pkgver=0.6.0.dev0.r72.g590cba1d
pkgrel=1
pkgdesc="A modern hardware definition language and toolchain based on Python (formerly nMigen)"
arch=(any)
url="https://github.com/amaranth-lang/amaranth"
license=('BSD-2-Clause')
depends=(
  'python'
  'python-jinja'
  'python-jschon'
  'python-pyvcd'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-packaging'
  'python-pdm-backend'
  'python-pyproject-patcher'
  'python-setuptools-scm'
  'python-wheel'
)
optdepends=('python-paramiko: for remote builds')
checkdepends=('python-pytest' 'symbiyosys-git' 'yices' 'yosys>0.16')
provides=("python-nmigen=$pkgver" "python-$_pkgname=$pkgver")
conflicts=('python-nmigen' "python-$_pkgname")
replaces=('python-nmigen-git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
  cd "$_pkgname"

  echo >&2 'Fixing package qualifier'
  sed -i -e "s/pdm\\.backend\\._vendor\\.//" pdm_build.py

  echo >&2 'Unpinning dependency version'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.strip_build_system_dependency_constraint('pdm-backend')
EOF
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  PYTHONPATH=. pytest
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
