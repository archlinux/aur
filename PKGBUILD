# Maintainer: Dominik Kummer <admin@arkades.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=python-pygments-git
_pkgname=python-pygments
pkgver=0
pkgrel=1
pkgdesc="Python syntax highlighter (Git)"
arch=('any')
url="https://pygments.org/"
license=('BSD-2-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wcag-contrast-ratio'
  'python-wheel'
)
checkdepends=(
  'python-lxml'
  'python-pytest'
)
provides=('pygmentize' "${_pkgname}")
conflicts=('pygmentize' "${_pkgname}")
replaces=('pygmentize' "${_pkgname}")
source=("git+https://github.com/pygments/${_pkgname#python-}.git")
b2sums=('SKIP')

pkgver() {
  cd ${_pkgname#python-}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${_pkgname#python-}
  python -m build --wheel --no-isolation
  make -C doc html
}

check() {
  cd ${_pkgname#python-}
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  mkdir -vp "$pkgdir/usr/share/doc"
  cp -vrT doc/_build/html "$pkgdir/usr/share/doc/$pkgname"
  install -vDm644 doc/pygmentize.1 -t "$pkgdir/usr/share/man/man1"
  install -vDm644 external/pygments.bashcomp \
    "$pkgdir/usr/share/bash-completion/completions/pygmentize"
}

# vim:set ts=2 sw=2 et:
