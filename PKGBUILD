# Maintainer: bitwave <aur [aT] oomlu {d.0t} de>
# Contributor: yochananmarqos
pkgname=notepadnext-git
pkgver=0.5.r7.gbfce019
pkgrel=1
pkgdesc="A cross-platform, reimplementation of Notepad++"
arch=('x86_64')
url="https://github.com/dail8859/NotepadNext"
license=('GPL3')
depends=('qt6-5compat' 'hicolor-icon-theme')
makedepends=('git' 'qt6-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dail8859/NotepadNext.git'
        'git+https://github.com/alex-spataru/QSimpleUpdater.git'
        'git+https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System.git'
        'git+https://github.com/editorconfig/editorconfig-core-qt.git'
        'git+https://github.com/itay-grudev/SingleApplication.git'
        'git+https://gitlab.freedesktop.org/uchardet/uchardet.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/NotepadNext"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/NotepadNext"
  git submodule init
  git config submodule.src/QSimpleUpdater.url "$srcdir/QSimpleUpdater"
  git config submodule.src/src/ads.url "$srcdir/Qt-Advanced-Docking-System"
  git config submodule.src/editorconfig-core-qt.url "$srcdir/editorconfig-core-qt"
  git config submodule.src/singleapplication.url "$srcdir/SingleApplication"
  git config submodule.src/uchardet.url "$srcdir/uchardet"
  git submodule update

  mkdir -p build
}

build() {
  cd "$srcdir/NotepadNext"

  pushd build
  qmake6 ../src/NotepadNext.pro
  make
  popd
}

package() {
  cd "$srcdir/NotepadNext"

  pushd build
  make INSTALL_ROOT="$pkgdir" install
  popd
}
