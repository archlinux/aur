# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pypipe-git
_gitpkgname=pypipe
pkgver=r37.a873590
pkgrel=1
pkgdesc='Python command-line tool for pipeline processing'
arch=('any')
url='https://github.com/bugen/pypipe'
license=('Apache')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
provides=('pypipe')
conflicts=('pypipe')
options=('!strip')

source=(
  "${_gitpkgname}::git+https://github.com/bugen/pypipe.git"
  'github-pr-18.patch'
)

sha512sums=(
  'SKIP'
  'ff291dbbacc7c15455a040e6c0fe1625eae634eca8ce71e07726a5643294790a8a8961ea2c80231b21ab2dc01b66fa8230f8f4c1f7f324f6de19670f73e24700'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitpkgname}"
  git clean -dfx

  # Remove this workaround once the PR has been accepted upstream
  patch -p1 < ../github-pr-18.patch
}

build() {
  cd "${srcdir}/${_gitpkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}"
  python -m pytest -v tests/
}

package() {
  cd "${srcdir}/${_gitpkgname}"

  echo >&2 'Packaging script'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" docs/*

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
