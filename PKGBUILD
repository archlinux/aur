# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=python-fire-git
_gitpkgname=fire
pkgver=0.7.0.r15.gdba7e1d
pkgrel=1
pkgdesc='A library for automatically generating command line interfaces'
arch=('any')
url="https://github.com/google/python-fire"
license=('Apache-2.0')
depends=(
  'python'
  'python-termcolor'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-hypothesis'
  'python-levenshtein'
  'python-pytest'
)
provides=("python-fire=${pkgver}")
conflicts=('python-fire')

source=(
  "${_gitpkgname}::git+https://github.com/google/python-fire.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd "${_gitpkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitpkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}"
  PYTHONPATH=build pytest
}

package() {
  local _site_packages

  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/*.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE

  echo >&2 'Removing test files'
  _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  # https://github.com/google/python-fire/issues/422
  rm -fv "${pkgdir}/${_site_packages}/${_gitpkgname}/"{testutils,*_test}.py
}
