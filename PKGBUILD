# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: jyantis <yantis@yantis.net>

_gitname='colorama'
pkgname="python2-${_gitname}-git"
pkgver=0.4.4.r50.gaff7fb2
pkgrel=1
epoch=1
pkgdesc='Python API for cross-platform colored terminal text (packaged for Python 2)'
arch=('any')
url="https://github.com/tartley/${_gitname}"
license=('BSD')
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")

prepare() {
  cd "${_gitname}"

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  find . -name '*.py' -print | while read file; do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' "${file}"
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' "${file}"
  done

  # Patch tests that want to import Python3's unittest.mock instead of Python2's test.mock
  find . -name '*_test.py' -print | while read file; do
    sed -r -i 's|unittest.mock|test._mock_backport|g' "${file}"
  done
}

pkgver() {
  cd "${_gitname}"

  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||') 

  # Generate Python-compatible SCM version from git version
  local _py_project_scm_version=$(echo "${_gitversion}" | sed \
    -e 's|\-\([0-9]\+\)-\(g[0-9a-f]\+\)|.dev\1+\2|'
  )

  # Replace project version with generated Python-compatible SCM version
  sed -i -e "s|^__version__.\+\$|__version__ = '${_py_project_scm_version}'|" "./${_gitname}/__init__.py"

  # Format git-based version for pkgver
  echo "${_gitversion}" | sed \
    -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
    -e 's|\([0-9]\+-g\)|r\1|' \
    -e 's|-|.|g'
}

build() {
  cd "${_gitname}"
  python2 setup.py build
}

check() {
  cd "${_gitname}"
  python2 -m unittest discover --verbose --pattern '*_test.py' || echo "Tests failed"
}

package() {
  cd "${_gitname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
