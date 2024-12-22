# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-ink-extensions-git
_gitpkgname=ink_extensions
pkgver=r47.7a167e4
pkgrel=1
pkgdesc='Python dependencies for running Inkscape extensions outside of Inkscape'
arch=('any')
url='https://github.com/evil-mad/ink_extensions'
license=('GPL-2.0-only')
depends=('python' 'python-lxml')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-mock')
provides=('python-ink-extensions')
conflicts=('python-ink-extensions')
options=('!debug' '!strip')

source=(
  "${_gitpkgname}::git+https://github.com/evil-mad/ink_extensions.git"
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
  cd "${srcdir}/${_gitpkgname}"

  # https://github.com/pypa/setuptools/issues/1347
  git clean -dfx
}

build() {
  cd "${srcdir}/${_gitpkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}"
  python -m unittest
}

package() {
  cd "${srcdir}/${_gitpkgname}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${_gitpkgname}/README.md"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_gitpkgname}/LICENSE"
}
