# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit-git
_gitpkgname=pip-audit
pkgver=r563.bc3ab4f
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/pypa/pip-audit'
license=('Apache-2.0')
depends=(
  'python-cachecontrol'
  'python-cyclonedx-lib'
  'python-html5lib'
  'python-pip-api'
  'python-pip-requirements-parser'
  'python-requests'
  'python-rich'
  'python-toml'
)
checkdepends=('git' 'python-pretend' 'python-pytest')
makedepends=(
  'git'
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel'
)
conflicts=('python-pip-audit')
provides=('python-pip-audit')
options=('!strip')
source=("${_gitpkgname}::git+https://github.com/pypa/pip-audit.git")
sha512sums=('SKIP')

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitpkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_gitpkgname}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
