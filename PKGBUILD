# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=vim
pkgname="$_pkgname-minimal-git"
pkgver=8.0.0342
pkgrel=1
pkgdesc="Vim the editor. CLI version providing small subset of available features."
arch=("i686" "x86_64")
url="http://www.vim.org"
license=("custom:vim")
depends=("vim-runtime-git")
makedepends=("git")
provides=("vim-minimal" "xxd")
conflicts=("vim-git" "gvim-git"
           "vim-minimal" "vim" "vim-python3" "gvim" "gvim-python3")
source=("git+https://github.com/vim/vim.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {

    # set global configuration file to /etc/vimrc
    sed -i 's|^.*\(#define SYS_VIMRC_FILE.*"\) .*$|\1|' $_pkgname/src/feature.h

}

build() {

    cd $_pkgname
    ./configure \
      --enable-fail-if-missing \
      --with-compiledby='Arch Linux AUR' \
      --prefix=/usr \
      --enable-gui=no \
      --with-features=tiny \
      --enable-perlinterp=no \
      --enable-pythoninterp=no \
      --enable-python3interp=no \
      --enable-rubyinterp=no \
      --enable-luainterp=no
    make

}

package() {

    # actual installation
    cd $_pkgname
    make DESTDIR=$pkgdir install

    # remove components provided by other packages

    # ex/view and man pages (normally provided by package 'vi' on Arch Linux) as
    # well as man evim (not needed in a package providing CLI tools only)
    cd $pkgdir/usr/bin ; rm ex view
    find $pkgdir/usr/share/man -type d -name 'man1' 2>/dev/null | \
      while read _mandir; do
        cd ${_mandir}
        rm -f ex.1 view.1
        rm -f evim.1
      done

    # components provided by vim-runtime-git
    cd $pkgdir
    rm -R usr/share/{icons,vim} usr/share/applications/gvim.desktop

    # add license
    install -D -m644 $srcdir/$_pkgname/runtime/doc/uganda.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
