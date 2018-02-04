# Maintainer: Alexander Drozdov <adrozdoff@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator
# Contributor: Tobias Hunger <tobias dot hunger at gmail dot com>

pkgname=qtcreator-opt-git
pkgver=4.5.0.r967.gcbcbaaa2f3
_pkgcommit=cbcbaaa2f3f35b0fdeb7bcfc7c9e064ca527bd64
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('i686' 'x86_64')
url='https://www.qt.io/ide/'
license=('GPL')
depends=('clang' 'qt5-svg' 'qt5-tools' 'qt5-webengine' 'qt5-script')
makedepends=('git' 'llvm' 'mesa')
# debug+strip to produce ${pkgname}-debug package with debug symbols
options=('docs' 'debug' 'strip')
optdepends=('bzr: bazaar support'
            'cmake: cmake project support'
            'cvs: cvs support'
            'gdb: debugger'
            'git: git support'
            'mercurial: mercurial support'
            'qt5-doc: integrated Qt documentation'
            'qt5-examples: welcome page examples'
            'qt5-translations: other languages'
            'subversion: subversion support'
            'valgrind: analyze support'
            'x11-ssh-askpass: ssh support')
source=("git+https://code.qt.io/qt-creator/qt-creator.git#commit=${_pkgcommit}"
        'git+https://code.qt.io/qbs/qbs.git'
        'QtProject-QtCreator-opt-git.xml'
        'qtcreator-opt-git.1'
        'qtcreator-opt-git.desktop')
sha256sums=('SKIP'
            'SKIP'
            '95e5f65d0e68a386bdd338f7daa502c76f080f3c619e1337592bbdfe0f6fe958'
            'b1d1e17aee668d96dcd4fd1ee8a2574b41d92dfb9b40568c0b5679a3c89617fe'
            '9d273c3fb3600ef51a3659138b4bf5d4f46dafce777dd4e654c0328c5870b514')

pkgver() {
    cd qt-creator
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s|^v||'
}

prepare() {
    # TODO: seems that this action is not needed, user can request full rebulding by call `makepkg -C`
    #[[ -d build ]] && rm -r build
    mkdir build || true

    # prepare submodules
    (
        cd qt-creator
        git submodule init
        git config submodule.qbs.url $srcdir/qbs
        git submodule update
    )

    # fix hardcoded libexec path
    sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qt-creator/qtcreator.pri
}

build() {
    cd build

    qmake -r LLVM_INSTALL_DIR=/usr QMAKE_CFLAGS_ISYSTEM=-I \
        "$srcdir"/qt-creator/qtcreator.pro
    make
    make docs -j1
}

package() {

    (
        cd build
        make INSTALL_ROOT="${pkgdir}/opt/qtcreator-git" install
        make INSTALL_ROOT="${pkgdir}/opt/qtcreator-git" install_docs
    )

    cd qt-creator

    # Private development files. Needed for plugin building.
    mkdir -p "${pkgdir}/usr/src/qtcreator-opt-git/"
    find | egrep -v '^\.\/doc\|^\.\/share\|^\.\/\.pc\|^\.\/debian\|^\.\/build\|^\.\/tests\|^\.\/share\|^\.\/builddir' | \
           grep '\.pri$\|\.h$\|\.hpp$\|\.inc$\|\.xsl$' | xargs -I{} cp --parents -r "{}" "${pkgdir}/usr/src/qtcreator-opt-git/"

    # App version information
    mkdir -p "${pkgdir}/usr/src/qtcreator-opt-git/src/app/"
    cp ../build/src/app/app_version.h "${pkgdir}/usr/src/qtcreator-opt-git/src/app/"

    # Icons
    mkdir -p ${pkgdir}/usr/share/icons
    mv ${pkgdir}/opt/qtcreator-git/share/icons/hicolor ${pkgdir}/usr/share/icons/
    for size in 128 16 24 256 32 48 512 64
    do
        resolution=${size}x${size}
        mv ${pkgdir}/usr/share/icons/hicolor/${resolution}/apps/QtProject-qtcreator.png ${pkgdir}/usr/share/icons/hicolor/${resolution}/apps/QtProject-qtcreator-opt-git.png
    done

    # License
    install -Dm644 "${srcdir}/qt-creator/LICENSE.GPL3-EXCEPT" \
        "${pkgdir}/usr/share/licenses/qtcreator-opt-git/LICENSE.GPL3-EXCEPT"

    # Launcher
    mkdir -p ${pkgdir}/usr/share/applications/
    install -Dm644 ${srcdir}/qtcreator-opt-git.desktop ${pkgdir}/usr/share/applications/qtcreator-opt-git.desktop

    # Mime
    mkdir -p ${pkgdir}/usr/share/mime/packages/
    install -Dm644 ${srcdir}/QtProject-QtCreator-opt-git.xml ${pkgdir}/usr/share/mime/packages/QtProject-QtCreator-opt-git.xml

    # Manpage
    mkdir -p ${pkgdir}/usr/man/man1
    install -Dm644 ${srcdir}/qtcreator-opt-git.1 ${pkgdir}/usr/man/man1/qtcreator-opt-git.1
    sed -i 's|/usr/share/qtcreator/doc|/opt/qtcreator-git/share/doc/qtcreator|' \
        ${pkgdir}/usr/man/man1/qtcreator-opt-git.1

    # Make binary link
    mkdir -p ${pkgdir}/usr/bin
    ln -s ../../opt/qtcreator-git/bin/qtcreator.sh \
        ${pkgdir}/usr/bin/qtcreator-opt-git
}
