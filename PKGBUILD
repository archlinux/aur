# Maintainer: dilipvamsi <m.dilipvamsi at gmail dot com>
# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=LightGBM
pkgbase='lightgbm-cuda'
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=2.2.3
pkgrel=1
pkgdesc="Distributed gradient boosting framework based on decision tree algorithms."
arch=('x86_64')
url="https://github.com/Microsoft/LightGBM"
license=('MIT')
depends=('boost-libs' 'ocl-icd' 'openmpi')
makedepends=('boost' 'cuda' 'cmake' 'opencl-headers' 'python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4a6414e808b343a784f0ee805ac723c094488f9e9a951dd3f709dc31ffb4ea4c')

conflicts=('lightgbm')

build() {
    cd "${_pkgname}-${pkgver}"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_OPENMP=ON \
        -DUSE_GPU=ON \
        -DUSE_MPI=ON \
        -DOpenCL_LIBRARY=/opt/cuda/lib64/libOpenCL.so \
        -DOpenCL_INCLUDE_DIR=/opt/cuda/include/

    cmake --build build
}

package_lightgbm-cuda() {
    cd "${_pkgname}-${pkgver}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-lightgbm-cuda() {
    depends=('lightgbm-cuda' 'python-numpy' 'python-scipy' 'python-scikit-learn')
    arch=('x86_64')

    cd "${_pkgname}-${pkgver}/python-package"
    # use library from /usr/lib instead of making a copy
    sed -i 's/..\/..\/lib\//\/usr\/lib\//' lightgbm/libpath.py
    python setup.py install --root="$pkgdir/" --optimize=1 --gpu --mpi --precompile --opencl-include-dir=/opt/cuda/include/ --opencl-library=/opt/cuda/lib64/libOpenCL.so
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "$pkgdir/usr/lib/python3.7/site-packages/lightgbm/lib_lightgbm.so"
}
