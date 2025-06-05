# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicadmodtree
pkgver=1.1.2.r2981.g6b404e2
pkgrel=1
epoch=
pkgdesc="This repository contains scripts to generate custom KiCAD footprints using python, and a framework which allows us to create custom KiCAD footprint. A big bunch of footprints of the KiCad library was developed using this framework."
arch=('any')
url="https://gitlab.com/kicad/libraries/kicad-footprint-generator"
license=(GPL-3.0-or-later)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
    #     nptyping
    pyclipper
    typing_extensions
    yaml
    # AUR
    #     cadquery
    #     ocp
    asteval-git
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
_pymakedeps=(
    pycodestyle
    build
    installer
    wheel
    numpy
    setuptools
    sphinx
    sphinx_rtd_theme
)
makedepends=(
    git
    nlopt
    "${_pymakedeps[@]/#/python-}"
)
checkdepends=(python-pytest)
options=('!strip')
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "${srcdir}/${pkgname}"
#     ./manage.sh tests
# }

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
