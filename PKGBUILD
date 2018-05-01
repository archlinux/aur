# -*- mode: shell-script -*-
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgbase=open3d-git
pkgname=( {,python-}open3d-git python-py3d-git )
pkgver=r1256.352d2f4
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
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    optdepends=(
        openmp
    )
    provides=(
        open3d
    )
    conflicts=(
        open3d
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
        openmp
    )
    privides=(
        python-open3d
        python-py3d{,-git}
    )
    conflicts=(
        python-open3d
        python-py3d{,-git}
    )
    cd "${pkgbase}/build"
    local SITE_PACKAGES="$(pacman -Qlq python | grep '/site-packages/$')"
    install -m 644 -D -t "${pkgdir}/${SITE_PACKAGES}" lib/py3d.*.so
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
        openmp
    )
    privides=(
        python-py3d
        python-open3d{,-git}
    )
    conflicts=(
        python-py3d
        python-open3d{,-git}
    )
    cd "${pkgbase}/build"
    local SITE_PACKAGES="$(pacman -Qlq python | grep '/site-packages/$')"
    install -m 644 -D -t "${pkgdir}/${SITE_PACKAGES}" lib/py3d.*.so
}
