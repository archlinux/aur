# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: jyantis <yantis@yantis.net>

pkgname=python2-colorama-git
pkgver=0.4.4.r50.gaff7fb2
pkgrel=1
epoch=1
pkgdesc='Simple cross-plaform colored terminal text in Python 2'
arch=('any')
url='https://github.com/tartley/colorama'
license=('BSD')
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=('git+https://github.com/tartley/colorama.git')
sha256sums=('SKIP')
provides=('python2-colorama')
conflicts=('python2-colorama')

prepare() {
  cd colorama

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done
}

pkgver() {
  cd colorama

  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||') 

  # Generate Python-compatible SCM version from git version
  local _py_project_scm_version=$(echo $_gitversion | sed \
    -e 's|\-\([0-9]\+\)-\(g[0-9a-f]\+\)|.dev\1+\2|'
  )

  # Replace project version with generated Python-compatible SCM version
  sed -i -e "s|^__version__.\+\$|__version__ = '${_py_project_scm_version}'|" './colorama/__init__.py'

  # Format git-based version for pkgver
  echo $_gitversion | sed \
    -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
    -e 's|\([0-9]\+-g\)|r\1|' \
    -e 's|-|.|g'
}

build() {
  cd colorama
  python2 setup.py build
}

check() {
  cd colorama
  python2 setup.py test --verbose
}

package() {
  cd colorama

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
