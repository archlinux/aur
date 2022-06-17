# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator
# Contributor: Tobias Hunger <tobias dot hunger at gmail dot com>

pkgname=qtcreator-git
pkgver=8.0.0.beta1.r49.g016321f0c8
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('x86_64')
url='https://www.qt.io'
license=(LGPL)
depends=(qt6-tools qt6-svg qt6-quick3d qt6-webengine qt6-serialport qt6-shadertools qt6-5compat
         'clang>=14' # ClangCodeModel based on clangd
         clazy yaml-cpp) # syntax-highlighting
makedepends=(cmake llvm python)
options=(docs)
optdepends=('bzr: bazaar support'
            'cmake: cmake project support'
            'cvs: cvs support'
            'gdb: debugger'
            'git: git support'
            'mercurial: mercurial support'
            'qt6-doc: integrated Qt documentation'
            'qt6-examples: welcome page examples'
            'qt6-translations: other languages'
            'subversion: subversion support'
            'valgrind: analyze support'
            'x11-ssh-askpass: ssh support')
provides=("qtcreator=$pkgver")
conflicts=(qtcreator)
source=('git+https://code.qt.io/qt-creator/qt-creator.git'
        'org.qt-project.qtcreator.desktop')
sha256sums=('SKIP'
            '90addb552923db0897f7096d166c2d1bf1c3390ae9c79687fc4ce7c4e57ee810')

pkgver() {
    cd qt-creator

    git describe --long --match v* | sed -r 's/([^-]*-g)/r\1/;s/-/./g' | sed -r 's/v//g'
}

prepare() {
    mkdir -p build

    cd qt-creator

    # fix hardcoded libexec path
    sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qtcreator.pri
}

build() {
    cd build
    
    cmake -B . -S "${srcdir}/qt-creator" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DWITH_DOCS=ON \
        -DBUILD_DEVELOPER_DOCS=ON \
        -DBUILD_QBS=OFF \
        -DQTC_CLANG_BUILDMODE_MATCH=ON
    cmake --build .
    cmake --build . --target docs
}

package() {
    cd build

    DESTDIR="$pkgdir" cmake --install .
    # Install docs
    cp -r share/doc "$pkgdir"/usr/share

    install -Dm644 "${srcdir}/qt-creator/LICENSE.GPL3-EXCEPT" \
        "${pkgdir}/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT"
        
    mkdir -p "${pkgdir}/usr/share/applications/"
    cp "${srcdir}/org.qt-project.qtcreator.desktop" "${pkgdir}/usr/share/applications/"
}
