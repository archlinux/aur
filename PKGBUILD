# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d
pkgname=( {,python-}open3d python-py3d )
pkgver=0.18.0
pkgrel=6
epoch=1
pkgdesc="A Modern Library for 3D Data Processing"
arch=('x86_64')
url="http://www.open3d.org"
license=('MIT')
depends=(
    libc++abi
    libc++
    curl
    embree
    eigen
    flann
    fmt
    glew
    glfw-x11
    gtest
    libjpeg-turbo
    libpng
    mesa
    python
    python-plotly
    python-dash
    pybind11
    xorg-server-devel
    gcc12
    nanoflann
    openssl
    pybind11
    qhull
    vtk
    unzip
)
optdepends=(
    'openmp: Multiprocess support'
    'jupyter-notebook: Jupyter notebook support'
)
makedepends=(
    cmake
    git
    python-setuptools
)
source=(
    "${pkgbase}::git+https://github.com/isl-org/Open3D.git#commit=5c982c7b5edc76f899860e2594a950c5c23ec88f"
    "fmt-v10.patch"
)
sha256sums=(
    'SKIP'
    '235a82931cee490a26bcd4a133ea787a4c5cd2da3f1c331225bbeb1f334e75ed')

function prepare() {
    cd "${srcdir}/${pkgbase}"
    patch -Np1 -i "${srcdir}/fmt-v10.patch"
    mkdir -p build
}

function build() {
    cd "${srcdir}/${pkgbase}/build"
    # find ../ -name "CMakeLists.txt" -exec sed -i 's/-Werror//g' {} \;
    # export CFLAGS=""
    # export CXXFLAGS=""
    cmake .. \
          -G "Unix Makefiles" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_C_COMPILER:STRING=/usr/bin/gcc-12 \
          -DCMAKE_CXX_COMPILER:STRING=/usr/bin/g++-12 \
          -DCMAKE_MODULE_PATH=/usr/lib/cmake/OpenVDB \
          -DUSE_SYSTEM_ASSIMP=ON \
          -DUSE_SYSTEM_CURL=ON \
          -DUSE_SYSTEM_EIGEN3=ON \
          -DUSE_SYSTEM_EMBREE=ON \
          -DUSE_SYSTEM_FMT=ON \
          -DUSE_SYSTEM_GLEW=ON \
          -DUSE_SYSTEM_GLFW=ON \
          -DUSE_SYSTEM_GOOGLETEST=ON \
          -DUSE_SYSTEM_JPEG=ON \
          -DUSE_SYSTEM_NANOFLANN=ON \
          -DUSE_SYSTEM_OPENSSL=ON \
          -DUSE_SYSTEM_PNG=ON \
          -DUSE_SYSTEM_PYBIND11=ON \
          -DUSE_SYSTEM_QHULLCPP=ON \
          -DUSE_SYSTEM_VTK=ON \
          -DUSE_SYSTEM_JSONCPP=OFF \
          -DWITH_MINIZIP=ON

    make -j$(nproc)
}

function package_open3d() {
    depends=(
        libc++abi
        libc++
        curl
        embree
        eigen
        flann
        fmt
        glew
        glfw-x11
        gtest
        libjpeg-turbo
        libpng
        mesa
        pybind11
        xorg-server-devel
        gcc12
        nanoflann
        openssl
        pybind11
        qhull
        vtk
        unzip
    )
    optdepends=(
        'openmp: Multiprocess support'
    )
    conflicts=(
        open3d-git
    )
    cd "${srcdir}/${pkgbase}/build"
    make DESTDIR="${pkgdir}" install
}

function package_python-open3d() {
    depends=(
        libc++abi
        libc++
        curl
        embree
        eigen
        flann
        fmt
        glew
        glfw-x11
        gtest
        libjpeg-turbo
        libpng
        mesa
        python
        python-plotly
        python-dash
        pybind11
        xorg-server-devel
        gcc12
        nanoflann
        openssl
        pybind11
        qhull
        vtk
        unzip
    )
    optdepends=(
        'jupyter-notebook: Jupyter notebook support'
        'openmp: Multiprocess support'
    )
    provides=(
        python-py3d
    )
    conflicts=(
        python-open3d-git
        python-py3d{,-git}
    )
    cd "${srcdir}/${pkgbase}/build"
    make python-package
    cd "${srcdir}/${pkgbase}/build/lib/python_package"
    python setup.py install --root="$pkgdir/" --optimize=1
}

function package_python-py3d() {
    depends=(
        libc++abi
        libc++
        curl
        embree
        eigen
        flann
        fmt
        glew
        glfw-x11
        gtest
        libjpeg-turbo
        libpng
        mesa
        python
        python-plotly
        python-dash
        pybind11
        xorg-server-devel
        gcc12
        nanoflann
        openssl
        pybind11
        qhull
        vtk
        unzip
    )
    optdepends=(
        'jupyter-notebook: Jupyter notebook support'
        'openmp: Multiprocess support'
    )
    provides=(
        python-open3d
    )
    conflicts=(
        python-py3d-git
        python-open3d{,-git}
    )
    cd "${srcdir}/${pkgbase}/build"
    make python-package
    cd "${srcdir}/${pkgbase}/build/lib/python_package"
    python setup.py install --root="$pkgdir/" --optimize=1
}
