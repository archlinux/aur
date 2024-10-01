# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=qpid-proton
pkgver=0.39.0
pkgrel=1
pkgdesc='High-performance, lightweight messaging library'
arch=('x86_64')
url='https://qpid.apache.org/proton'
license=('Apache')
depends=('libjsoncpp.so' 'libsasl' 'openssl' 'python')
provides=("python-qpid-proton=${pkgver}")
makedepends=('cmake' 'doxygen' 'python-installer' 'python-setuptools' 'python-sphinx' 'python-wheel' 'python-cffi' 'swig')
options=(!emptydirs)
source=("https://dlcdn.apache.org/qpid/proton/${pkgver}/qpid-proton-${pkgver}.tar.gz"
        "python-3.12.patch::https://github.com/apache/qpid-proton/commit/ba49d2309c5a1abf0afcaad6d61d48fc5a6b7b85.patch")
sha512sums=('df5c5469ee82ba02de62dce15b73b81aab2aae07c7db668182df690cea4ff7584111bd12143fe5e3569469a9ddf4950ac68d60b53d1a7815da4748052948cd1b'
            '4e0045d13e721a5c32bd33b4b91b0132611a69555366ea5d1f4bbc8842016efd4247dce42519c421fbfd1b9ee71b0f029f0bdc0ba2f4e992a263562621e70209')

_srcname="$pkgname-$pkgver"

prepare() {
    cd "${srcdir}/${_srcname}"
    patch -Np1 < "../python-3.12.patch"
}

build() {
    cd "${srcdir}"

    cmake -B build -S "${_srcname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_SUFFIX='' \
        -DENABLE_TOX_TEST=OFF \
        -DBUILD_CPP=ON \
        -DBUILD_GO=OFF \
        -DBUILD_PYTHON=ON \
        -DBUILD_RUBY=OFF \
        -DBUILD_TLS=ON \
        -DENABLE_JSONCPP=ON \
        -DENABLE_OPENTELEMETRYCPP=OFF \
        -DBUILD_EXAMPLES=ON \
        -DBUILD_TESTING=ON \
        -DENABLE_BENCHMARKS=OFF
    cmake --build build
    cmake --build build --target docs

    cd build/python
    sphinx-build docs docs/build --builder man
}

check() {
    cd "${srcdir}/build"

    make test || true
}

package() {
    cd "${srcdir}"

    DESTDIR="${pkgdir}" cmake --install build
    python -m installer --destdir="${pkgdir}" build/python/dist/*.whl
    install -Dm644 "${_srcname}/cpp/README.md" -T "${pkgdir}/usr/share/proton/README.cpp.md"
    install -Dm644 "${_srcname}/python/README.rst" -T "${pkgdir}/usr/share/proton/README.python.rst"
    install -Dm644 build/python/docs/build/qpidprotonpythonapi.1 -t "${pkgdir}/usr/share/man/man1/"
}
