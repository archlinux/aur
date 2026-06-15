# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_name=easymesh4openems
_pkgname=python-${_name}
pkgname=${_pkgname}-git
pkgver=r52.75231fb
pkgrel=1
pkgdesc='Automatic mesh generation for OpenEMS/CSXCAD'
arch=(any)
url=https://github.com/MustafaAlchalabi/easyMesh4openEMS
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-numpy'
    'python-openems'
    'python-csxcad'
)
makedepends=(
    'git'
    'python-build'
    'python-wheel'
    'python-installer'
    'python-setuptools'
)
checkdepends=()
optdepends=(
    'python-matplotlib: Used in tutorial files'
)
source=("${_name}::git+${url}")
b2sums=("SKIP")

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_name}"

    # Don't compile the tutorial, it will be moved later on
    printf '\nexclude = ["Tutorials"]\n' >> pyproject.toml
}

build() {
    cd "${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # Install Tutorial into /usr/share/
    install -d "${pkgdir}/usr/share/${_pkgname}"
    cp -a Tutorials/ ${pkgdir}/usr/share/${_pkgname}/
}

# vim: set ts=4 sw=4 et:
