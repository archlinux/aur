# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d-git
pkgname=( {,python-}open3d-git python-py3d-git )
pkgver=r2539.f3c7158a
pkgrel=1
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
source=("${pkgbase}::git+https://github.com/intel-isl/Open3D.git"
        fix_3rdparty_path.patch)
sha256sums=('SKIP'
            '3bf6b79fd075b356a5c2d86a557e0bc6e6df0e84d53c2077d2c6685641838d81')

function pkgver() {
    cd "${pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
    make
}

function package_open3d-git() {
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
    provides=(
        open3d
    )
    optdepends=(
        'openmp: Multiprocess support'
    )
    conflicts=(
        open3d
    )
    cd "${srcdir}/${pkgbase}/build"
    make install
}

function package_python-open3d-git() {
    depends=(
        eigen
        glew
        glfw-x11
        jsoncpp
        libjpeg-turbo
        libpng
        mesa
        open3d-git
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

function package_python-py3d-git() {
    depends=(
        eigen
        glew
        glfw-x11
        jsoncpp
        libjpeg-turbo
        libpng
        mesa
        open3d-git
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
