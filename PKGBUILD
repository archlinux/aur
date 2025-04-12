# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="cclib"
pkgname="python-${_name}-git"
pkgver=1.8.2.r5198.028874a4
pkgrel=1
pkgdesc="A library for parsing and interpreting the results of computational chemistry packages. (git version)"
arch=("any")
url="http://cclib.github.io"
license=("BSD-3-Clause")
makedepends=("git"
             "python-build"
             "python-installer"
             "python-setuptools"
             "python-versioningit"
             "python-wheel")
checkdepends=("psi4"
              "python-biopython"
              "python-iodata"
              "python-pyquante2"
              "python-pyscf"
              "python-pytest")
depends=("python-packaging" "python-periodictable" "python-scipy")
optdepends=('psi4: for Psi4 bridge'
            'python-ase: for ASE bridge'
            'python-biopython: for generating `BioPython.Atom`s of parsed results'
            'python-iodata: for reading proatom densities from horton'
            'python-openbabel: for generating `OBMol`s of results'
            'python-pandas: for generating DataFrames of parsed results'
            'python-pyquante2: for computing grid-based quantities with cube output'
            'python-pyscf: for PySCF bridge')
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("git+https://github.com/${_name}/${_name}")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${_name}" clean -dfx

  cd "${srcdir}/${_name}"

  # remove upper version restriction on versioningit
  sed -i "s/versioningit~=2.0/versioningit/" pyproject.toml
}

build() {
  cd "${srcdir}/${_name}"

  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}"

  /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# Requires many heavy dependencies
# check() {
#   cd "${srcdir}/${_name}"
#   /usr/bin/python -m pytest
# }

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
