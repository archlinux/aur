# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name="chemlab"
pkgbase="python-${_name}-git"
pkgname=("python-${_name}-git" "python2-${_name}-git")
pkgver=0.4.1.r725.cc10e09
pkgrel=1
pkgdesc="A general Python library for computational chemistry (git version)"
arch=("x86_64" "i686")
url="http://chemlab.github.io/chemlab"
# chemlab is released under the GNU LGPL license if the PyQt parts are
# omitted (such as chemlab.graphics and chemlab.mviewer packages) or
# the GNU GPL3 license otherwise.
license=("LGPL3" "GPL3")
depends=("python" "python-numpy"
         "python2" "python2-numpy")
makedepends=("git"
             "cython"
             "cython2")
source=("git+https://github.com/${_name}/${_name}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  _parent_ver=$(git log --tags --simplify-by-decoration --pretty="format:%d" | head -n 1 | cut -d " " -f 3 | tr -d "v)")
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build_python-chemlab-git() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

build_python2-chemlab-git() {
  cd "${srcdir}/${_name}"
  python2 setup.py build
}

package_python-chemlab-git() {
  provides=("python-${_name}")
  conflicts=("python-${_name}")
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-chemlab-git() {
  provides=("python2-${_name}")
  conflicts=("python2-${_name}")
  cd "${srcdir}/${_name}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  # Keep /usr/bin driver scripts, but not the default name.
  cd "${pkgdir}/usr/bin"
  for i in $(ls); do
    mv "${i}" "${i}2"
  done
}
