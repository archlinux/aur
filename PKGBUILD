# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=LightGBM
pkgbase=lightgbm
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=3.3.5
pkgrel=1
pkgdesc="Distributed gradient boosting framework based on decision tree algorithms."
arch=('x86_64')
url="https://github.com/Microsoft/LightGBM"
license=('MIT')
depends=('boost-libs' 'ocl-icd' 'openmpi')
makedepends=('boost' 'cmake' 'opencl-headers' 'python-setuptools' 'eigen' 'fmt')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('16fb9e299ced37be5ac69dd510e7323337e623019c9c578628c43b285f764be7')

prepare(){
    cd "${_pkgname}-${pkgver}"

    sed -i "97 a find_package(Eigen3 REQUIRED)" CMakeLists.txt
    sed -i '98 a include_directories(${EIGEN3_INCLUDE_DIRS})' CMakeLists.txt

    sed -i "s/\"..\/..\/..\/external_libs\/fmt\/include\/fmt\/format.h\"/<fmt\/format.h>/" include/LightGBM/utils/common.h
    mkdir external_libs/fast_double_parser/include
    curl https://raw.githubusercontent.com/lemire/fast_double_parser/ace60646c02dc54c57f19d644e49a61e7e7758ec/include/fast_double_parser.h -o external_libs/fast_double_parser/include/fast_double_parser.h

    cmake -S. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_OPENMP=ON \
        -DUSE_GPU=ON \
        -DUSE_MPI=ON
}

build() {
    cd "${_pkgname}-${pkgver}"
    cmake --build build
}

package_lightgbm() {
    cd "${_pkgname}-${pkgver}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-lightgbm() {
    depends=('lightgbm' 'python-numpy' 'python-scipy' 'python-scikit-learn')

    cd "${_pkgname}-${pkgver}/python-package"
    # use library from /usr/lib instead of making a copy
    sed -i 's/..\/..\/lib\//\/usr\/lib\//' lightgbm/libpath.py
    python setup.py install --root="$pkgdir/" --optimize=1 --gpu --mpi --precompile
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
