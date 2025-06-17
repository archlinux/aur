# Maintainer: Max Luebke <maxluebke(at)gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: bitwave <aur [aT] oomlu {d.0t} de>
# Contributor: yochananmarqos

pkgname=notepadnext
pkgver=0.12
pkgrel=1
pkgdesc="Cross-platform reimplementation of Notepad++"
arch=('x86_64')
url="https://github.com/dail8859/NotepadNext"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'libxcb' 'qt6-5compat' 'hicolor-icon-theme' 'qt6-base')
makedepends=('git' 'qt6-tools')
source=("$pkgname::git+$url#tag=v$pkgver"
    'git+https://github.com/alex-spataru/QSimpleUpdater'
    'git+https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System'
    'git+https://github.com/editorconfig/editorconfig-core-qt'
    'git+https://github.com/itay-grudev/SingleApplication'
    'git+https://gitlab.freedesktop.org/uchardet/uchardet.git/'
    'missing_stdlib_hdr.patch')

sha256sums=('1ece102a395ac1c20da55bda35fa9aed3b96ff30410b7e93190e2fac28f9d5a4'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'fc13d8633f55957aad51218548c622a51ada3002a6fcdffeaea00cd5708c1b4a')

prepare() {
    cd "${srcdir}/${pkgname}"

    patch -p1 <"${srcdir}/missing_stdlib_hdr.patch"

    git submodule init
    git config submodule.src/QSimpleUpdater.url "$srcdir/QSimpleUpdater"
    git config submodule.src/src/ads.url "$srcdir/Qt-Advanced-Docking-System"
    git config submodule.src/editorconfig-core-qt.url "$srcdir/editorconfig-core-qt"
    git config submodule.src/singleapplication.url "$srcdir/SingleApplication"
    git config submodule.src/uchardet.url "$srcdir/uchardet"
    git -c protocol.file.allow=always submodule update
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}/build"
    qmake6 ../src/NotepadNext.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make INSTALL_ROOT="${pkgdir}" install
}
