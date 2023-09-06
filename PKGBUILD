# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Contributor: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d
pkgname=( {,python-}open3d python-py3d )
pkgver=0.17.0
pkgrel=1
epoch=4
pkgdesc="A Modern Library for 3D Data Processing"
arch=('x86_64')
url="http://www.open3d.org"
license=('MIT')
depends=(
    libc++abi
    libc++
    eigen
    flann
    fmt
    glew
    glfw-x11
    jsoncpp
    libjpeg-turbo
    libpng
    mesa
    python
    pybind11
    xorg-server-devel
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
    "${pkgbase}::git+https://github.com/isl-org/Open3D.git#tag=v${pkgver}-1fix6008"
    "v0.17.0-1fix6008.patch"
)
sha256sums=('SKIP' 'SKIP')

function prepare() {
    cd "${srcdir}/${pkgbase}"
    git submodule update --init --recursive
    patch -p1 -i "${srcdir}/v0.17.0-1fix6008.patch"
    mkdir build
}

function build() {
    cd "${srcdir}/${pkgbase}/build"
    # find ../ -name "CMakeLists.txt" -exec sed -i 's/-Werror//g' {} \;
    cmake .. \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_BUILD_TYPE=Release
    make -j$(nproc)
}

function package_open3d() {
    depends=(
        libc++abi
        libc++
        eigen
        flann
        fmt
        glew
        glfw-x11
        jsoncpp
        libjpeg-turbo
        libpng
        mesa
        python
        pybind11
        xorg-server-devel
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
        eigen
        flann
        fmt
        glew
        glfw-x11
        jsoncpp
        libjpeg-turbo
        libpng
        mesa
        open3d
        python
        pybind11
        xorg-server-devel
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
        eigen
        flann
        fmt
        glew
        glfw-x11
        jsoncpp
        libjpeg-turbo
        liblzf
        libpng
        mesa
        open3d
        python
        pybind11
        xorg-server-devel
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
