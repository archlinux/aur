# Maintainer: redponike <proton (dot) me>
# Contributor: dilipvamsi <m.dilipvamsi at gmail dot com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=LightGBM
pkgbase='lightgbm-cuda'
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=4.6.0
pkgrel=1
pkgdesc="Distributed gradient boosting framework based on decision tree algorithms."
arch=('x86_64')
url="https://github.com/Microsoft/LightGBM"
license=('MIT')
depends=('cuda' 'gcc13' 'boost-libs' 'openmpi')
makedepends=('boost' 'cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 
             'git' 'python-scikit-build-core')
source=("${_pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('1e2c2e8ebe9acb8b730e7ca56efddee3ee6bf11d2674efccf4bb27673e1529c0')
conflicts=('lightgbm')

prepare() {
    cd ${_pkgname}-${pkgver}
    git submodule update --init --recursive
}

build() {
    # We need GCC < 14 to build for now
    export CC="gcc-13" CXX="g++-13"
    cd "${_pkgname}-${pkgver}"

    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_OPENMP=ON \
        -DUSE_CUDA=ON \
        -DUSE_MPI=ON \
        -DBUILD_CLI=ON \
        
    cmake --build build
}

package_lightgbm-cuda() {
    cd "${_pkgname}-${pkgver}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-lightgbm-cuda() {
    depends=('lightgbm-cuda' 'python-numpy' 'python-scipy')
    optdepends=('python-dask' 'python-matplotlib' 'python-pandas' 'python-pyarrow' 'python-scikit-learn')
    arch=('x86_64')
    
    mkdir -p "${srcdir}/lightgbm-python"
    cp -r "${_pkgname}-${pkgver}/python-package" "${srcdir}/lightgbm-python/"
    cp -r "${_pkgname}-${pkgver}/CMakeLists.txt" "${srcdir}/lightgbm-python/"
    cp -r "${_pkgname}-${pkgver}/include" "${srcdir}/lightgbm-python/"
    cp -r "${_pkgname}-${pkgver}/src" "${srcdir}/lightgbm-python/"
    cp -r "${_pkgname}-${pkgver}/swig" "${srcdir}/lightgbm-python/"
    cp -r "${_pkgname}-${pkgver}/cmake" "${srcdir}/lightgbm-python/"
    cp -r "${_pkgname}-${pkgver}/external_libs" "${srcdir}/lightgbm-python/"
    
    cp "${_pkgname}-${pkgver}/LICENSE" "${srcdir}/lightgbm-python/python-package/"

    cd "${srcdir}/lightgbm-python/python-package"
    python -m build --wheel --no-isolation \
            --config-setting=cmake.define.USE_CUDA=ON \
            --config-setting=cmake.define.USE_MPI=ON \
            --config-setting=cmake.define.__BUILD_FOR_PYTHON=ON \
            --config-setting=cmake.source-dir=..
    
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${srcdir}/lightgbm-python"
}
