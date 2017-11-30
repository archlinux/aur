# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qt3dstudio-git
pkgver=2b75758
pkgrel=1
pkgdesc='A world class 3D User Interface design tool.'
arch=('i686' 'x86_64')
url='https://www.qt.io'
license=('GPL')
depends=('fbx-sdk' 'qt5-base' 'qt5-multimedia' 'qt5-declarative' 'qt5-tools')
makedepends=('git')
options=('docs')
optdepends=()
provides=('qt3dstudio')
conflicts=('qt3studio')
source=('git+https://code.qt.io/qt3dstudio/qt3dstudio.git'
        'git+https://code.qt.io/qt3dstudio/qt3dstudio-collada-dom.git'
        'git+https://code.qt.io/qt3dstudio/qt3dstudio-eastl.git'
        'git+https://code.qt.io/qt3dstudio/qt3dstudio-lua.git'
        'git+https://code.qt.io/qt3dstudio/qt3dstudio-pcre.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd qt3dstudio
    git describe --always --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    [[ -d build ]] && rm -r build
    mkdir build

    cd "$srcdir"/qt3dstudio
    git submodule init
    git config submodule.src/3rdparty/ColladaDOM.url "$srcdir"/qt3dstudio-collada-dom
    git config submodule.src/3rdparty/EASTL.url "$srcdir"/qt3dstudio-eastl
    git config submodule.src/3rdparty/Lua.url "$srcdir"/qt3dstudio-lua
    git config submodule.src/3rdparty/pcre.url "$srcdir"/qt3dstudio-pcre
    git submodule update
}

build() {
    cd build

    qmake QMAKE_CFLAGS_ISYSTEM=-I \
          "$srcdir"/qt3dstudio/qt3dstudio.pro
    make
    make docs
}

package() {
    cd build

    make INSTALL_ROOT="${pkgdir}/usr/" install
    make INSTALL_ROOT="${pkgdir}/usr/" install_docs
}
