# Maintainer: Peter Mattern <pmattern at arcor dot de>

# Interpreters are handled by value "dynamic" of configure options
# '--enable-<language>interp' and can thus be chosen at runtime by installing appropriate
# packages. Counterpart of Vim packages '-python3' no longer needed, IMHO.

_pkgname=vim
pkgname=gvim-gtk3
pkgver=7.4.2249
pkgrel=1
pkgdesc="Vim, the text editor. CLI version and GTK3 GUI providing majority of features."
arch=("i686" "x86_64")
url="http://www.vim.org"
license=("custom:vim")
depends=("gtk3" "hicolor-icon-theme" "gtk-update-icon-cache" "desktop-file-utils")
optdepends=("lua: Lua interpreter" "perl: Perl interpreter" "python: Python 3 interpreter"
            "python2: Python 2 interpreter" "ruby: Ruby interpreter")
makedepends=("git" "lua" "python" "python2" "ruby")
provides=("gvim" "xxd" "vim-runtime")
conflicts=("vim-minimal-git" "vim-git" "vim-runtime" "vim-runtime-git"
           "vim-minimal" "vim" "vim-python3" "gvim" "gvim-python3" "gvim-git")
source=("https://github.com/vim/vim/archive/v$pkgver.tar.gz"
        "gvim.desktop")
sha256sums=('3aac9c87636a232e1319ccea2bfeaa0de3160f17efcaf02bf52247008487bf76'
            '86e4e5d23ae91580460baee86e49d64e40659408daa9836d488af516e22dd1e9')
install=gvim.install

prepare() {
    SRC="$srcdir/${_pkgname}-$pkgver"
    cd $SRC
    # set global configuration files to /etc/[g]vimrc
    sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h
}

build() {
    SRC="$srcdir/${_pkgname}-$pkgver"
    cd $SRC
    ./configure \
      --enable-fail-if-missing \
      --with-compiledby='Arch Linux AUR' \
      --prefix=/usr \
      --enable-gui=gtk3 \
      --with-features=huge \
      --enable-cscope \
      --enable-multibyte \
      --enable-perlinterp=dynamic \
      --enable-pythoninterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic
    make

}

package() {
    SRC="$srcdir/${_pkgname}-$pkgver"
    # actual installation
    cd $SRC
    make DESTDIR=$pkgdir install
    cd -
    pv="${_pkgname}"

    # desktop entry file and corresponding icon
    install -Dm644 ../gvim.desktop      $pkgdir/usr/share/applications/gvim.desktop
    install -Dm644 $pv/runtime/vim48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/gvim.png

    # remove ex/view and man pages (normally provided by package 'vi' on Arch Linux)
    cd $pkgdir/usr/bin ; rm ex view
    find $pkgdir/usr/share/man -type d -name 'man1' 2>/dev/null | \
      while read _mandir; do
        cd ${_mandir}
        rm -f ex.1 view.1
      done

    # add license
    install -Dm644 $SRC/runtime/doc/uganda.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
