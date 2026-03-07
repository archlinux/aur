# Maintainer: taotieren <admin@taotieren.com>

pkgbase=treelite
pkgname=(treelite python-treelite)
pkgver=4.7.0
pkgrel=1
pkgdesc="Universal model exchange and serialization format for decision tree forests"
arch=($CARCH)
url="https://github.com/dmlc/treelite"
license=('Apache-2.0')
groups=()
replaces=()
makedepends=(
    cmake
    ninja
    git
    doxygen
    pkgconf
    nlohmann-json
    rapidjson
    python
    python-numpy
    python-scipy
    python-packaging
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=()
optdepends=()
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d267a3ff3f6c030f127a8066d3cae0545497de901185765635c045df6fa7059e')
options=()

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build

    cd "${srcdir}/${pkgbase}-${pkgver}/python"
    python -m build --wheel --no-isolation
}

package_treelite() {
    arch=($CARCH)
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        gcc-libs
        glibc
    )
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase}-${pkgver}/build install
}

package_python-treelite() {
    pkgdesc+=" - python"
    arch=($CARCH)
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        python
        python-numpy
        python-scipy
        python-packaging
    )
    cd "${srcdir}/${pkgbase}-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
