# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-cmake
_name=${pkgname#python-}
pkgver=4.4.4
pkgrel=1
epoch=
pkgdesc="CMake is an open-source, cross-platform family of tools designed to build, test and package software"
arch=($CARCH)
url="https://github.com/scikit-build/cmake-python-distributions"
license=('Apache-2.0 AND BSD-3-Clause')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    sh
    cmake
    glibc
    libgcc
    libstdc++
    libidn2
    openssl
    ncurses
    python
)
makedepends=(
    git
    python-scikit-build-core
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=$pkgver")
noextract=()
sha256sums=('7e8553bdd0d0aac63fd87e0805097486ccab450cee42666bad13205546a95e26')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
        # -Ccmake.define.BUILD_CMAKE_FROM_SOURCE=ON \
        # -Ccmake.define.CMakePythonDistributions_ARCHIVE_DOWNLOAD_DIR=${srcidr}/cmake
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    rm -rf ${pkgdir}/usr/bin
}
