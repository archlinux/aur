# Maintainer: Michal Donat <donny579@gmail.com>

pkgname=supertuxkart-git
pkgver=22805+18484
pkgrel=1
pkgdesc="A kart racing game featuring Tux and his friends - development version"
url="http://supertuxkart.sourceforge.net/"
license=("cc-by-sa-3.0")
arch=('i686' 'x86_64')

makedepends=("git" "subversion" "cmake" "bluez-libs" "libvpx" "python")

depends=("libvorbis" "freealut" "libgl" "glut" "fribidi" "glew" "libopenglrecorder" "libjpeg-turbo" "libpng" "freetype2" "sdl2")

conflicts=("supertuxkart")
replaces=("supertuxkart-cmakesvn" "supertuxkart-svn")

source=(
    "stk-code::git+https://github.com/supertuxkart/stk-code.git"

    # Use this source for the network alpha testing branch
    #"stk-code::git+https://github.com/supertuxkart/stk-code.git#branch=network"

    # assets reside in subversion repository
    "stk-assets::svn+https://svn.code.sf.net/p/supertuxkart/code/stk-assets"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/stk-code"
    local _git_rev="$(git rev-list --count HEAD)"

    cd "${srcdir}/stk-assets"
    local _assets_rev="$(svnversion)"

    printf "%s+%s" "${_git_rev}" "${_assets_rev}"
}

build() {
    cd "${srcdir}/stk-code"
    if [ -d "cmake_build" ]; then
        rm -rf cmake_build
    fi
    mkdir cmake_build
    cd cmake_build

    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    # -DBUILD_RECORDER=off     - disable in-game recorder (then you can remove the dependency `libopenglrecorder`)
    make
}

package() {
    cd "stk-code/cmake_build"
    make DESTDIR=${pkgdir} install

    if [ -d "${pkgdir}/usr/lib64" ]; then
      mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
    fi
}
