# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pypipe-git
_gitpkgname=pypipe
pkgver=r83.29f6595
pkgrel=2
pkgdesc='Python command-line tool for pipeline processing'
arch=('any')
url='https://github.com/bugen/pypipe'
license=('Apache-2.0')
depends=('bash' 'python')
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
options=('!debug' '!strip')

source=(
  "${_gitpkgname}::git+https://github.com/bugen/pypipe.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

prepare() {
  git -C "${srcdir}/${_gitpkgname}" clean -dfx
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
