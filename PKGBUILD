# Maintainer: Peter Mattern <pmattern at arcor dot de>

# Note
# Unlike package qvim this one is using Vim code as imported by / into vim-Qt
# upstream and does not rely on package vim-runtime.
# This seemed reasonable to me with regards to performing tests as one main
# purpose of VCS packages.

_pkgname=vim-qt
pkgname=$_pkgname-qt5-git
pkgver=20130201.47.ge1ebbe8
pkgrel=2
pkgdesc="An experimental Qt GUI for Vim. Built against Qt5."
arch=("i686" "x86_64")
url="https://bitbucket.org/equalsraf/vim-qt"
license=("unknown" "custom:vim")
depends=("gpm" "gawk" "qt5-base" "libxkbcommon-x11" "gtk-update-icon-cache" "desktop-file-utils")
optdepends=("lua: Lua interpreter" "python: Python 3 interpreter" "python2: Python 2 interpreter"
            "ruby: Ruby interpreter")
makedepends=("git" "lua" "python" "python2" "ruby")
provides=("$_pkgname" "$_pkgname-git" "qvim"
          "vim-runtime" "vim" "vim-minimal" "vim-python3"
          "xxd")
conflicts=("$_pkgname" "$_pkgname-git" "qvim"
           "vim-runtime" "vim" "vim-minimal" "vim-python3" "gvim" "gvim-python3")
install=vim-qt-qt5-git.install
source=("git+https://github.com/equalsraf/vim-qt.git"
        "vim-qt.desktop")
sha256sums=("SKIP"
            "0ff453488a4b04b6364e6a6a8fd17cf0bfe66ef2c19fd39cc9263d99845a0db5")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/^package.//;s/-/./g"
}

prepare() {
    cd $_pkgname
    # set global configuration file to /etc/vimrc
    sed -i 's|^.*\(#define SYS_VIMRC_FILE.*"\) .*$|\1|' src/feature.h
}

build() {

    cd $_pkgname

    ./configure \
      --enable-fail-if-missing \
      --with-compiledby='Arch Linux AUR' \
      --prefix=/usr \
      --enable-gui=qt \
      --with-qt-qmake=/usr/bin/qmake-qt5 \
      --with-features=huge \
      --enable-cscope \
      --enable-multibyte \
      --enable-luainterp=dynamic \
      --enable-perlinterp=dynamic \
      --enable-pythoninterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic

    make

}

package() {

    # actual installation
    cd $_pkgname
    make DESTDIR=$pkgdir install

    # desktop entry file and corresponding icon
    install -D -m644 ../vim-qt.desktop        $pkgdir/usr/share/applications/vim-qt.desktop
    install -D -m644 src/qt/icons/vim-qt.png  $pkgdir/usr/share/icons/hicolor/64x64/apps/vim-qt.png

    # add link 'qvim'
    cd $pkgdir/usr/bin ; ln -sf vim qvim

    # remove ex / view and corresponding main pages (normally provided by package 'vi' on Arch Linux)
    cd $pkgdir/usr/bin ; rm ex view
    find $pkgdir/usr/share/man -type d -name 'man1' 2>/dev/null | \
        while read _mandir; do
            cd ${_mandir}
            rm -f ex.1 view.1
        done

    # add Vim license
    install -D -m644 $srcdir/$_pkgname/runtime/doc/uganda.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.vim
}
