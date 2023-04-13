# Maintainer: entshuld < edgar [ no ] openmail cc>
# Original maintainer: Lennart Braun <lenerd@posteo.de>
_base=onnx
pkgname=onnx-py
pkgver=1.13.1
pkgrel=1
pkgdesc="C++ library for the open standard for machine learning interoperability (built with Python API)"
arch=('x86_64')
url="https://onnx.ai"
license=('MIT')
depends=('glibc' 'protobuf'
         "python-protobuf"
         "python-numpy"
         "python-six"
         "python-typing_extensions"
         "python38")
makedepends=('cmake' 'git' 'python'
             "python-setuptools"
             "python-pip"
             "gtest")
source=("${_base}-$pkgver.tar.gz::https://github.com/${_base}/${_base}/archive/v$pkgver.tar.gz")
sha512sums=('325859f591dece43a083a0945aefe3427bfdb68a98ef5922343bf7ed959528947e7664d6c8e3e3d35c390d6c20ef22d07c672e5311f80c72c199931be6c256c3')
provides=("onnx" "python-onnx")
options=(!staticlibs !emptydirs)
install=onnx.install
conflicts=("onnx" "python-onnx")

prepare() {
    cd "${_base}-${pkgver}"
    _build="${srcdir}"/build
    [ ! -d "${_build}" ] && mkdir "${_build}"

    cd "${_build}"
    python3.8 -m venv --clear env
    source env/bin/activate
    pip install protobuf numpy six typing_extensions setuptools
    deactivate
}

build() {
    _build="${srcdir}"/build
    cd "${_build}"

    source "${_build}"/env/bin/activate

    # make sure CMake gets the flags
    export CPPFLAGS CFLAGS CXXFLAGS LDFLAGS MAKEFLAGS
    CONFOPTS=(
      -DCMAKE_BUILD_TYPE='None'
      -DCMAKE_INSTALL_PREFIX=/usr
      -DONNX_BUILD_TESTS=ON
      -DONNX_USE_PROTOBUF_SHARED_LIBS=ON
      -DCMAKE_POSITION_INDEPENDENT_CODE=ON
      -DBUILD_ONNX_PYTHON=ON
      -Wno-dev)
    cmake ${CONFOPTS[@]} -B "${_build}" \
          -S "${srcdir}"/"${_base}-${pkgver}"
    make -C "${_build}"

    cd "${srcdir}"/"${_base}-${pkgver}"
    python setup.py build

    deactivate
}

check() {
    _build="${srcdir}"/build
    cd "${_build}"
    source env/bin/activate

    LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./onnx_gtests

    deactivate
}

package() {
    _build="${srcdir}"/build
    cd "${_build}"
    source env/bin/activate

    make DESTDIR="${pkgdir}/" install
    install -Dm644 "${srcdir}"/"${_base}-${pkgver}"/LICENSE\
            "${pkgdir}/usr/share/licenses/${_base}/LICENSE"

    cd "${srcdir}"/"${_base}-${pkgver}"
    python setup.py install -O1 --prefix=/usr\
           --root="${pkgdir}" --skip-build

    find "${pkgdir}" -type d -name test -prune -exec rm -r {} \;

    deactivate
}
