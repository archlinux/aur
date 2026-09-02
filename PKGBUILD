# Maintainer: taotieren <admin@taotieren.com>

pkgbase=treelite
pkgname=(treelite python-treelite)
pkgver=4.7.2
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
    python-scikit-build-core
    python-build
    python-installer
    python-wheel
    python-setuptools
    # AUR
    mdspan
)
checkdepends=()
optdepends=()
source=("${pkgbase}::git+${url}.git#tag=${pkgver}")
sha256sums=('e9f114890aa4c0a3435b773fad2e345975231f3902f1702c42e0c886c894713a')
options=()

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgbase}/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-author \
        -B build \
        -G Ninja

    ninja -C build

    cd "${srcdir}/${pkgbase}/python"
    python -m build --wheel --no-isolation
}

package_treelite() {
    arch=($CARCH)
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        libgcc
        libgomp
        libstdc++
    )
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase}/build install
}

package_python-treelite() {
    pkgdesc+=" - python"
    arch=($CARCH)
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        libgcc
        libgomp
        libstdc++
        python
        python-numpy
        python-scipy
        python-packaging
    )
    cd "${srcdir}/${pkgbase}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
