# Maintainer: Zhirui Dai <daizhirui at hotmail dot com>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d
pkgname=( {,python-}open3d python-py3d )
pkgver=0.18.0
pkgrel=11
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
    assimp
    eigen
    flann
    fmt
    glew
    glfw-x11
    gtest
    libjpeg-turbo
    jsoncpp
    liblzf
    libpng
    mesa
    python
    python-plotly
    python-dash
    pybind11
    xorg-server-devel
    nanoflann
    openssl
    pybind11
    qhull
    vtk
    unzip
    utf8cpp
    openxr
    openvr
    asciidoc
    python-mpi4py
    postgresql
    mysql
    onetbb
    zeromq
    cppzmq
    intel-oneapi-basekit
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
    "${pkgbase}::git+https://github.com/isl-org/Open3D.git#commit=dbb3c7d58b7af5819540dacd8ea4e0a11ab605dc"
    "no_werror.patch"
    "fmt-v11.patch::https://github.com/daizhirui/Open3D/commit/3773d816260c5912581397a0dadf08da4c943d68.patch"
    "archlinux.patch::https://github.com/daizhirui/Open3D/commit/9745817370d1d504d45344959a000189bb9213cb.patch"
)
sha256sums=(
    'SKIP'
    'e58dacd86497e4d8a61fe00e4e41a4b8748e1dcca8d3172918d1bc5a1e7390cc'
    '7477f6ac021bf11804b19f4005bcbc1032789346e75efee3eca1c979024ae476'
    'd652b06bd4bc10f4eed18a69cd42cc07d10a58728ff6adddb45fb2a7c488dd9e')

function prepare() {
    cd "${srcdir}/${pkgbase}"
    patch -Np1 -i "${srcdir}/no_werror.patch"
    patch -Np1 -i "${srcdir}/fmt-v11.patch"
    patch -Np1 -i "${srcdir}/archlinux.patch"
    # find . -name "CMakeLists.txt" -exec sed -i 's/-Werror//g' {} \;
    # grep --files-with-matches -r "_FORTIFY_SOURCE" | xargs -I {} sed -i 's/_FORTIFY_SOURCE=[0-9]/""/g' {}
    mkdir -p build
}

function build() {
    cd "${srcdir}/${pkgbase}/build"
    if [[ -f CMakeCache.txt ]]; then
        rm CMakeCache.txt
    fi
    
    # default makepkg.conf set flags to "-O2"
    export CFLAGS=""
    export CXXFLAGS=""
    cmake .. \
          -G "Unix Makefiles" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_VERBOSE_MAKEFILE=ON \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_MODULE_PATH=/usr/lib/cmake/OpenVDB \
          -DCMAKE_FIND_ROOT_PATH=/opt/intel/oneapi/tbb/latest/lib/cmake/tbb \
          -DUSE_SYSTEM_ASSIMP=ON \
          -DUSE_SYSTEM_CURL=ON \
          -DUSE_SYSTEM_BLAS=OFF \
          -DBUILD_SYCL_MODULE=OFF \
          -DUSE_SYSTEM_EIGEN3=ON \
          -DUSE_SYSTEM_EMBREE=ON \
          -DUSE_SYSTEM_TBB=ON \
          -DOPEN3D_USE_ONEAPI_PACKAGES=ON \
          -DoneDPL_DIR=/opt/intel/oneapi/dpl/latest/lib/cmake/oneDPL \
          -DMKL_DIR=/opt/intel/oneapi/mkl/latest/lib/cmake/mkl \
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
          -DUSE_SYSTEM_ZEROMQ=ON \
          -DUSE_SYSTEM_JSONCPP=ON \
          -DUSE_SYSTEM_LZF=ON \
          -DBUILD_LIBREALSENSE=ON \
          -DWITH_MINIZIP=ON

    make -j$(nproc)
}

function package_open3d() {
    depends=(
        libc++abi
        libc++
        curl
        embree
        assimp
        eigen
        flann
        fmt
        glew
        glfw-x11
        gtest
        libjpeg-turbo
        jsoncpp
        liblzf
        libpng
        mesa
        python
        python-plotly
        python-dash
        pybind11
        xorg-server-devel
        nanoflann
        openssl
        pybind11
        qhull
        vtk
        unzip
        utf8cpp
        openxr
        openvr
        asciidoc
        python-mpi4py
        postgresql
        mysql
        onetbb
        zeromq
        cppzmq
        intel-oneapi-basekit
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
        assimp
        eigen
        flann
        fmt
        glew
        glfw-x11
        gtest
        libjpeg-turbo
        jsoncpp
        liblzf
        libpng
        mesa
        python
        python-plotly
        python-dash
        pybind11
        xorg-server-devel
        nanoflann
        openssl
        pybind11
        qhull
        vtk
        unzip
        utf8cpp
        openxr
        openvr
        asciidoc
        python-mpi4py
        postgresql
        mysql
        onetbb
        zeromq
        cppzmq
        intel-oneapi-basekit
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
        assimp
        eigen
        flann
        fmt
        glew
        glfw-x11
        gtest
        libjpeg-turbo
        jsoncpp
        liblzf
        libpng
        mesa
        python
        python-plotly
        python-dash
        pybind11
        xorg-server-devel
        nanoflann
        openssl
        pybind11
        qhull
        vtk
        unzip
        utf8cpp
        openxr
        openvr
        asciidoc
        python-mpi4py
        postgresql
        mysql
        onetbb
        zeromq
        cppzmq
        intel-oneapi-basekit
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
