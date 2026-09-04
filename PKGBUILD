# shellcheck disable=SC2034,SC2154,SC2164,SC2128
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgbase=kotki
pkgname=('kotki' 'python-kotki')
pkgver=0.6.0.1
_pkgver=0.6.0-1
pkgrel=1
pkgdesc="Translation engine and Python bindings"
arch=('x86_64')
url="https://github.com/terslang/kotki"

makedepends=(
    'cmake' 'marian-lite' 'rapidjson'
    'pybind11' 'python-build' 'python-installer'
    'python-setuptools' 'python-wheel'
    'cli11' 'intgemm' 'sentencepiece-browsermt'
)

source=(
    "https://github.com/terslang/kotki/archive/refs/tags/v${_pkgver}.tar.gz"
    "fix-pykotki.patch"
)

sha256sums=(
    '6784f82cd5bd9be5a9de28a1a30a21881aa0cbc9ac2a0a744afd82fbff57a50c'
    '014be1568fce652dd662f4cc4c1562fb83152f12e22d2bc0127dca4512d0c0ab'
)

prepare() {
    cd "${srcdir}/${pkgbase}-${_pkgver}"

    patch -Np1 -i "${srcdir}/fix-pykotki.patch"

    sed -i 's/-DRECONSTRUCT_GIT=ON//' setup.py
    sed -i 's/-DVENDORED_LIBS=ON/-DVENDORED_LIBS=OFF/' setup.py
}

build() {
    local STAGE="${srcdir}/staging"
    cd "${srcdir}/${pkgbase}-${_pkgver}"

    msg2 "Compiling the main Kotki engine (C)..."
    cmake -B build-kotki \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D BUILD_DEMO=ON \
        -D STATIC=OFF \
        -D SHARED=ON

    cmake --build build-kotki -j"$(nproc)"

    DESTDIR="${STAGE}" cmake --install build-kotki

    msg2 "Compiling Python's bindings..."
    CMAKE_ARGS="-DCMAKE_PREFIX_PATH=${STAGE}/usr" \
        python -m build --wheel --no-isolation
}

package_kotki() {
    pkgdesc="High-performance language translations without using the cloud"
    license=('MIT')
    depends=('marian-lite' 'rapidjson')

    cd "${srcdir}/${pkgbase}-${_pkgver}"

    DESTDIR="${pkgdir}" cmake --install build-kotki
}

package_python-kotki() {
    pkgdesc="Python bindings and CLI tools for kotki (kotki-cli, kotki-web)"
    license=('MPL-2.0')
    depends=(
        'kotki' 'python' 'python-click'
        'python-langdetect' 'python-pyyaml'
        'python-appdirs' 'python-requests'
        'python-quart' 'python-quart-schema'
    )

    cd "${srcdir}/${pkgbase}-${_pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}