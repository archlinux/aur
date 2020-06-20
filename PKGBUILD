# Maintainer: Panagiotis Vasilopoulos <hello@alwayslivid.com>
# Contributor: Michal Donat <donny579@gmail.com>

pkgname=supertuxkart-server-git
pkgver=22105+
pkgrel=1
pkgdesc="Server for SuperTuxKart - development version"
url="http://supertuxkart.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64' 'aarch64')

makedepends=("git" "cmake" "bluez-libs" "libvpx")

depends=("libvorbis" "freealut" "libgl" "glut" "fribidi" "glew" "libjpeg-turbo" "libpng" "freetype2")

source=(
    "stk-code::git+https://github.com/supertuxkart/stk-code.git"
)

md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/stk-code"
    local _git_rev="$(git rev-list --count HEAD)"

    printf "%s+%s" "${_git_rev}" "${_assets_rev}"
}

build() {
    cd "${srcdir}/stk-code"
    if [ -d "cmake_build" ]; then
        rm -rf cmake_build
    fi
    mkdir cmake_build
    cd cmake_build

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_RECORDER=off \
       -DESERVER_ONLY=ON -DCHECK_ASSETS=off ..
    make
}

package() {
    cd "stk-code/cmake_build"
    make DESTDIR=${pkgdir} install

    cd "${pkgdir}/usr/share/pixmaps"
    if [ ! -f supertuxkart.png ]; then
        ln -s supertuxkart{_128,}.png
    fi
    if [ -d "${pkgdir}/usr/lib64" ]; then
      mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
    fi
}
