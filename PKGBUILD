# -*- mode: shell-script -*-
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d
pkgname=( {,python-}open3d )
pkgver=0.1.2
pkgrel=1
pkgdesc="A Modern Library for 3D Data Processing"
arch=('x86_64')
url="http://www.open-3d.org"
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
    gawk
    make
)
changelog="${pkgbase}.changelog"
source=("Open3D-${pkgver}.tar.gz::https://github.com/Open-3D/Open3D/archive/v0.1.2.tar.gz")
md5sums=('466a9edd042484e115986ebceeae77b2')

function prepare() {
    cd "Open3D-${pkgver}"
    mkdir -p build
}

function build() {
    cd "Open3D-${pkgver}/build"
    cmake .. \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_BUILD_TYPE=Release
    make
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
    cd "Open3D-${pkgver}/build"
    local SITE_PACKAGES="$(awk 'BEGIN {FS="="} /^PYTHON_SITE_PACKAGES:PATH\>/ {print $2}' CMakeCache.txt)"
    install -m 644 -D -t "${pkgdir}/usr/lib" lib/libopen3d*.so
    install -d "${pkgdir}/usr/include"
    cp -R ../modules/{Core,IO,Visualization,Python}/include/Open3D "${pkgdir}/usr/include"
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
    cd "Open3D-${pkgver}/build"
    local SITE_PACKAGES="$(awk 'BEGIN {FS="="} /^PYTHON_SITE_PACKAGES:PATH\>/ {print $2}' CMakeCache.txt)"
    install -m 644 -D -t "${pkgdir}/${SITE_PACKAGES}" lib/open3d.*.so
}
