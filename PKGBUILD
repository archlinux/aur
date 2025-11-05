# Maintainer: taotieren <admin@taotieren.com>

pkgbase=treelite
pkgname=(treelite python-treelite)
pkgver=4.6.0
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
sha256sums=('ccc568c5cacf97312a5e3f4275fc5dd060c52b0b3723ad433766a4ba659c354a')
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
