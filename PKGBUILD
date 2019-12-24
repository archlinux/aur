# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="cclib"
pkgname="python-${_name}-git"
pkgver=1.6.3.r2939.8ecf965c
pkgrel=2
pkgdesc="A library for parsing and interpreting the results of computational chemistry packages. (git version)"
arch=("any")
url="http://cclib.github.io"
license=("BSD-3-Clause")
makedepends=("python-setuptools" "git")
depends=("python-numpy" "python-packaging" "python-periodictable")
optdepends=('python-openbabel: for generating `OBMol`s of results'
            'python-biopython: for generating `BioPython.Atom`s of parsed results'
            'python-pandas: for generating DataFrames of parsed results'
            'python-scipy: for calculating properties of nuclear configurations')
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("git+https://github.com/${_name}/${_name}")
md5sums=('SKIP')


package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

pkgver() {
  cd "${srcdir}/${_name}"
  _parent_ver=$(git describe --tags --abbrev=0 | tr -d v)
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
