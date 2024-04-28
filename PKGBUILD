# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-ink-extensions-git
_gitpkgname=ink_extensions
pkgver=r39.487529e
pkgrel=3
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
  'github-pr-17.patch'
  'github-pr-18.patch'
)

sha512sums=(
  'SKIP'
  '299a0094685db480a10decfd191d25edce557901b315c537266100aa37c3be1c58c3a6c6faa376946a986b3eba401c72b3714c725a2345433112755c45e652b0'
  '324ede544239365c9ef0a1c1d7e4a60081f6e3a0edf8950ac06da9dc1c91e15a4801a12ced065f33f8f65b29f07884b56dd9c25a4e15a8a6aff600ef659a64ed'
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

  # Fix test failures: `'called_once_with' is not a valid assertion`
  # Remove this patch once upstream has merged PR #17.
  # See also: https://github.com/evil-mad/ink_extensions/pull/17
  patch -p1 < ../github-pr-17.patch

  # Fix syntax warning under Python 3.12
  # Remove this patch once upstream has merged PR #18.
  # See also: https://github.com/evil-mad/ink_extensions/pull/18
  patch -p1 < ../github-pr-18.patch
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
