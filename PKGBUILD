# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
pkgver=20230710
pkgrel=3
pkgdesc="Ouster Python SDK"
arch=(any)
url="https://github.com/ouster-lidar/ouster_example"
license=('BSD')
makedepends=(
    'cmake'
    'eigen'
    'pybind11'
    'python-build'
    'python-installer'
    'python-pytest'
    'python-setuptools'
    'python-wheel'
)
depends=(
    'flatbuffers'
    'glew'
    'glfw-x11'
    'jsoncpp'
    'libpng'
    'libtins'
    'python'
    'python-numpy'
    'python-typing_extensions'
    'python-zeroconf'
    'spdlog'
)
checkdepends=('python-tox')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "0001-ouster_client-Fix-spdlog-issues.patch"
        "0002-ouster_osf-Add-missing-cstdint-include.patch"
)
sha256sums=('07e64ad3dc831924a3c57aae6a36e3297937a1231689dc4344a841b7a24052bb'
            '6fe40ab9d86b489237caf24aec263c9c50c60ce53e813790598efd37791d5b95'
            '67adc034d82dbbbcb1d3439d21f645a3470fc5d7fc5080f15ca2947cf34d879a')
_srcdir=ouster_example-${pkgver}/python

prepare() {
    cd ${_srcdir}
    perl -pe "s/,(?!.*,).*?(?=])// if $. == 4" -i pyproject.toml
    sed -i "2d" tox.ini

    # Drop cmake requirements, for some reason doesn't match on Arch
    sed -i -e 's:,\s\+"cmake==[0-9\.]\+"::' pyproject.toml

    cd ..
    # Fix to work with newer versions of flatbuffers, spdlog, and pybind 2.11
    sed -i -e 's:flatbuffers\:\:flatbuffers:flatbuffers:' ouster_osf/CMakeLists.txt
    patch -p1 < "${srcdir}/0001-ouster_client-Fix-spdlog-issues.patch"
    patch -p1 < "${srcdir}/0002-ouster_osf-Add-missing-cstdint-include.patch"
}

build() {
    cd ${_srcdir}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_srcdir}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

check() {
    tox --installpkg ${_srcdir}/dist/ouster_sdk-*.whl -c ${_srcdir}
}
