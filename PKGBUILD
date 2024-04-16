# Maintainer:  
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Matteo Triggiani <davvore33@gmail.com>

_pypiname='pickleDB'
_distname='pickledb'
pkgname=python-${_distname}
pkgver=0.9.3.r13.g68b24d6
pkgrel=1
_commit_untagged_v_0_9_3=0c62055d29faba4a410016df7b5fe31ad7811801
_commit_current=68b24d6291a89923ae604feab1f8817d9b1792b6
pkgdesc='A lightweight, fast and simple database based on Python’s own json module'
url="https://pypi.org/project/${_pypiname}"
_repourl="https://github.com/patx/${_distname}"
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("${_distname}::git+${_repourl}.git#commit=${_commit_current}")
b2sums=('SKIP')

prepare() {
  cd "${_distname}"
  git tag -f v0.9.3 "${_commit_untagged_v_0_9_3}"

  sed -e "s/from distutils.core import setup/from setuptools import setup/" \
      -i setup.py
}

pkgver() {
    cd "${_distname}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    # Or in case of 'post': 1.5.0.post1.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's;^\([0-9][0-9.]*\)[-_.]\([a-zA-Z]\+\);\1\2;' \
        -e 's;\([0-9]\+-g\);r\1;' \
        -e 's;-;.;g' \
        -e 's;\(post.*\);\.\1;'
}

build() {
  cd "${_distname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_distname}"
  pytest tests.py -v
}

package() {
  cd "${_distname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
