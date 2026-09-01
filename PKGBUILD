# Maintainer: taotieren <admin@taotieren.com>

pkgbase=treelite
pkgname=(treelite python-treelite)
pkgver=4.7.1
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
sha256sums=('dee2d37a9826bddb2b29b1dba4c020a97e4973d76dc83be5a0546c83c0d9db3e')
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
