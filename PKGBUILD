# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-vspackrgb
_origpkgname=vspackrgb
pkgver=1.3.0
pkgrel=2
pkgdesc="RGB packing for VapourSynth frames"
arch=("x86_64")
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-view'
license=("MIT")
depends=(
    "python-hatch-cython-varde-git"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-wheel"
    "python-setuptools"
    "python-hatchling"
    "python-versioningit"
    "python-hatch-sbom"
)
source=("${pkgname}::git+${url}.git#tag=${_origpkgname}/v${pkgver}")
sha256sums=('af376e67816d21c91a5cfccf551303f383101e597e525833761e21a826094054')

prepare() {
    cd "${pkgname}/src/${_origpkgname}" || exit
    sed -i 's|hatch-cython @ git+https://github.com/Varde-s-Forks/hatch-cython.git|hatch-cython|' pyproject.toml
    sed -i '/"setuptools-git-versioning"/d' pyproject.toml
    sed -i "s/dynamic = \[\"version\"\]/version = \"$pkgver\"/g" pyproject.toml
    sed -i '/\[tool.setuptools-git-versioning\]/,/]/d' pyproject.toml
}

build() {
    cd "${pkgname}/src/${_origpkgname}" || exit
    rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}/src/${_origpkgname}" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
