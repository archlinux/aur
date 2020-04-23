# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Contributor: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d
pkgname=( {,python-}open3d python-py3d )
pkgver=0.9.0
pkgrel=1
epoch=3
pkgdesc="A Modern Library for 3D Data Processing"
arch=('x86_64')
url="http://www.open3d.org"
license=('MIT')
depends=(
    eigen
    glew
    glfw-x11
    jsoncpp
    libjpeg-turbo
    libpng
    mesa
    xorg-server-devel
)
optdepends=(
    'openmp: Multiprocess support'
    'pybind11: System pybind11 support'
    'python: Python support'
    'jupyter-notebook: Jupyter notebook support'
)
makedepends=(
    cmake
    git
    python-setuptools
)
source=("${pkgbase}::git+https://github.com/intel-isl/Open3D.git#tag=v${pkgver}"
        fix_3rdparty_path.patch)
sha256sums=('SKIP'
            '3bf6b79fd075b356a5c2d86a557e0bc6e6df0e84d53c2077d2c6685641838d81')

function prepare() {
    cd "${srcdir}/${pkgbase}"
    patch --forward --strip=1 --input="${srcdir}/fix_3rdparty_path.patch"
    git submodule update --init --recursive
    mkdir build
}

function build() {
    cd "${srcdir}/${pkgbase}/build"
    cmake .. \
          -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_BUILD_TYPE=Release
    make -j$(nproc)
}

function package_open3d() {
    depends=(
        eigen
        glew
        glfw-x11
        jsoncpp
        libjpeg-turbo
        libpng
        mesa
        xorg-server-devel
    )
    optdepends=(
        'openmp: Multiprocess support'
    )
    conflicts=(
        open3d-git
    )
    cd "${srcdir}/${pkgbase}/build"
    make install
}

function package_python-open3d() {
    depends=(
        eigen
        glew
        glfw-x11
        jsoncpp
        libjpeg-turbo
        libpng
        mesa
        open3d
        python
        xorg-server-devel
    )
    optdepends=(
        'jupyter-notebook: Jupyter notebook support'
        'openmp: Multiprocess support'
        'pybind11: System pybind11 support'
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
        eigen
        glew
        glfw-x11
        jsoncpp
        libjpeg-turbo
        libpng
        mesa
        open3d
        python
        xorg-server-devel
    )
    optdepends=(
        'jupyter-notebook: Jupyter notebook support'
        'openmp: Multiprocess support'
        'pybind11: System pybind11 support'
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
