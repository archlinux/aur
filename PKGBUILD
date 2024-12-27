# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-treetable-git
_gitpkgname=treetable
pkgver=r37.8ea894b
pkgrel=2
pkgdesc='Pretty-print ASCII tables with a tree-like structure'
arch=('any')
url='https://github.com/adefossez/treetable'
license=('Unlicense')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
provides=("python-treetable=${pkgver}")
conflicts=('python-treetable')
source=("${_gitpkgname}::git+https://github.com/adefossez/treetable.git")
sha512sums=('SKIP')

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

build() {
  cd "${_gitpkgname}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}"
  echo >&2 'Running test'
  python test.py > actual.txt
  if ! grep -qE 'index\s+status\s+\|\s+precision\s+recall' actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    misc

  echo >&2 'Packaging the examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" \
    demo.py test.py

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
