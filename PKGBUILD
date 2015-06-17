# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="cclib"
pkgbase="python-${_name}-git"
pkgname=("python-${_name}-git" "python2-${_name}-git")
pkgver=1.3.2.r1726.4a8a952
pkgrel=1
pkgdesc="A library for parsing and interpreting the results of computational chemistry packages. (git version)"
arch=("any")
url="http://cclib.github.io"
license=("LGPL")
makedepends=("git")
source=("git+https://github.com/${_name}/${_name}")
sha256sums=('SKIP')

package_python-cclib-git() {
  depends=("python" "python-numpy")
  provides=("python-cclib")
  conflicts=("python-cclib")
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
  find "${pkgdir}" -name "*.pyc" -delete
  find "${pkgdir}" -type d -empty -delete
}

package_python2-cclib-git() {
  depends=("python2" "python2-numpy")
  provides=("python2-cclib")
  conflics=("python2-cclib")
  cd "${srcdir}/${_name}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  find "${pkgdir}" -name "*.pyc" -delete
  find "${pkgdir}" -type d -empty -delete
  # Keep /usr/bin driver scripts, but not the default name.
  cd "${pkgdir}/usr/bin"
  for i in $(ls); do
    mv "${i}" "${i}2"
  done
}

pkgver() {
  cd "${srcdir}/${_name}"
  _parent_ver=$(git log --tags --simplify-by-decoration --pretty="format:%d" | head -n 1 | cut -d " " -f 3 | tr -d ")" | tr -d v)
  _parent_major_ver=$(echo "${_parent_ver}" | cut -d "." -f 1)
  _parent_minor_ver=$(echo "${_parent_ver}" | cut -d "." -f 2)
  _parent_patch_ver=$(echo "${_parent_ver}" | cut -d "." -f 3)
  # Don't use the patch version of the parent tag.
  _git_patch_ver=$((_parent_patch_ver+1))
  printf "%s.%s.%s.r%s.%s" \
         "${_parent_major_ver}" \
         "${_parent_minor_ver}" \
         "${_git_patch_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}
