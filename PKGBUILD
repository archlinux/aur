# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qt3dstudio-git
pkgver=2b75758
pkgrel=2
pkgdesc='A world class 3D User Interface design tool.'
arch=('i686' 'x86_64')
url='https://doc.qt.io/qt3dstudio'
license=('GPL3')
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
        'git+https://code.qt.io/qt3dstudio/qt3dstudio-pcre.git'
        'org.qt-project.qt3dstudio.desktop' 'QtProject-Qt3DStudio.png')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'dba01d14e6069a4b68cd1b1a6a34d9e4'
         '5962b4d51980e22b98e490a954a21cb2')

pkgver() {
    cd qt3dstudio
    git describe --always --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    [[ -d build ]] && rm -r build
    mkdir build

    cd "${srcdir}"/qt3dstudio
    git submodule init
    git config submodule.src/3rdparty/ColladaDOM.url "${srcdir}"/qt3dstudio-collada-dom
    git config submodule.src/3rdparty/EASTL.url "${srcdir}"/qt3dstudio-eastl
    git config submodule.src/3rdparty/Lua.url "${srcdir}"/qt3dstudio-lua
    git config submodule.src/3rdparty/pcre.url "${srcdir}"/qt3dstudio-pcre
    git submodule update
}

build() {
    cd build

    qmake QMAKE_CFLAGS_ISYSTEM=-I \
          "${srcdir}"/qt3dstudio/qt3dstudio.pro
    make
    make docs
}

package() {
    cd build

    make INSTALL_ROOT="${pkgdir}/" install
    make INSTALL_ROOT="${pkgdir}/" install_docs
    mkdir -p "${pkgdir}"/usr/share/applications
    mkdir -p "${pkgdir}"/usr/share/pixmaps/hicolor/128x128/apps
    install -Dm644 "${srcdir}"/org.qt-project.qt3dstudio.desktop "${pkgdir}"/usr/share/applications/org.qt-project.qt3dstudio.desktop
    install -Dm644 "${srcdir}"/QtProject-Qt3DStudio.png "${pkgdir}"/usr/share/pixmaps/hicolor/128x128/apps/QtProject-Qt3DStudio.png
}
