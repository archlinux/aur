# -*- mode: shell-script -*-
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d
pkgname=( {,python-}open3d python-py3d )
pkgver=0.1.1
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
    openmp
    python
)
makedepends=(
    cmake
    findutils
    gawk
    git
    make
    pacman
    sed
)
checkdepends=(
    gtest
)
changelog="${pkgbase}.changelog"
source=("${pkgbase}::git+https://github.com/IntelVCL/Open3D.git")
md5sums=(SKIP)

function pkgver() {
    cd "${pkgbase}"
    # grab the latest tag
    git describe --tags --abbrev=0 | sed -e 's/^v\?//'
}

function prepare() {
    cd "${pkgbase}"
    mkdir -p build
}

function build() {
    cd "${pkgbase}/build"
    cmake ../src \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_SHARED_LIBS=ON \
          -DOpen3D_BUILD_UNIT_TESTS=ON \
          -DCMAKE_BUILD_TYPE=Release
    make
}

function check() {
    cd "${pkgbase}/build"
    bin/unitTests
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
        openmp
    )
    conflicts=(
        open3d-git
    )
    cd "${pkgbase}/build"
    install -m 644 -D -t "${pkgdir}/usr/lib" lib/lib*.so
    find ../src/{Core,Experimental,IO,Python,Tools,Visualization} -name '*.h' \
        | sed -e 's|\.\./src/||' \
        | xargs -I{} -n1 \
                install -m 644 -D -T ../src/{} "${pkgdir}"/usr/include/Open3D/{}
    find bin -type f \( -not -name unitTests -not -path 'bin/Test/*' \) \
        | xargs -I{} install -m 755 -D -t "${pkgdir}"/usr/bin {}
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
        openmp
    )
    privides=(
        python-py3d
    )
    conflicts=(
        python-open3d-git
        python-py3d{,-git}
    )
    cd "${pkgbase}/build"
    local SITE_PACKAGES="$(pacman -Qlq python | grep '/site-packages/$')"
    install -m 644 -D -t "${pkgdir}/${SITE_PACKAGES}" lib/py3d.*.so
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
        openmp
    )
    privides=(
        python-py3d
    )
    conflicts=(
        python-py3d-git
        python-open3d{,-git}
    )
    cd "${pkgbase}/build"
    local SITE_PACKAGES="$(pacman -Qlq python | grep '/site-packages/$')"
    install -m 644 -D -t "${pkgdir}/${SITE_PACKAGES}" lib/py3d.*.so
}
