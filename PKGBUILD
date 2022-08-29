# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit-git
_gitpkgname=pip-audit
pkgver=r280.0ea49c4
pkgrel=3
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/trailofbits/pip-audit'
license=('Apache')
depends=(
  # Upstream requires pip-api >= 0.0.28 but Arch’s Community
  # repository is on 0.0.21, which causes an error message that
  # says “failed to list installed distributions.”
  # Once community/python-pip-api catches up to version 0.0.28,
  # remove the `>=0.0.28` part from the following line.
  'python-pip-api>=0.0.28'
  'python-pip-requirements-parser'
  'python-packaging'
  'python-dataclasses'
  'python-progress'
  'python-resolvelib'
  'python-html5lib'
  # Upstream requires cachecontrol >= 0.12.10 but Arch’s Community
  # repository is at 0.12.6.
  # The 0.12.6 version appears to work just fine, so let’s ignore
  # the mismatch.
  'python-cachecontrol'
  'python-lockfile'
  'python-cyclonedx-lib'
)
makedepends=(
  'git'
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel'
)
conflicts=('python-pip-audit')
options=('!strip')
source=("${_gitpkgname}::git+https://github.com/trailofbits/pip-audit.git")
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

package() {
  cd "${srcdir}/${_gitpkgname}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
