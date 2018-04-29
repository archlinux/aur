# -*- mode: shell-script -*-
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d
pkgname=( {,python-}open3d )
pkgver=v0.1.2.r3.fb969e1
pkgrel=2
epoch=1
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
source=("${pkgbase}::git+http://code.open-3d.org")
md5sums=(SKIP)

function pkgver() {
    cd "${pkgbase}"
    # grab the latest tag
    git describe --tags --long \
        | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

function prepare() {
    cd "${pkgbase}"
    mkdir -p build
}

function build() {
    cd "${pkgbase}/build"
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
    cd "${pkgbase}/build"
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
    cd "${pkgbase}/build"
    local SITE_PACKAGES="$(awk 'BEGIN {FS="="} /^PYTHON_SITE_PACKAGES:PATH\>/ {print $2}' CMakeCache.txt)"
    install -m 644 -D -t "${pkgdir}/${SITE_PACKAGES}" lib/open3d.*.so
}
