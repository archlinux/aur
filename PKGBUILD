# Maintainer: Peter Mattern <pmattern at arcor dot de>

# Interpreters are handled by value "dynamic" of configure options
# '--enable-<language>interp' and can thus be chosen at runtime by installing appropriate
# packages. Counterpart of Vim packages '-python3' no longer needed, IMHO.

_pkgname=vim
pkgname="gvim-git"
pkgver=7.4.1967
pkgrel=2
pkgdesc='Vim the editor. CLI version and GTK2 GUI providing majority of features.'
arch=('i686' 'x86_64')
url='http://www.vim.org'
license=('custom:vim')
depends=('vim-runtime-git' 'libxt' 'gtk2')
optdepends=('lua: Lua interpreter' 'perl: Perl interpreter' 'python: Python 3 interpreter'
            'python2: Python 2 interpreter' 'ruby: Ruby interpreter')
makedepends=('git' 'lua' 'python' 'python2' 'ruby')
provides=('gvim' 'xxd')
conflicts=("vim-minimal"{,-git} "vim"{,-git} 'vim-python3' "gvim"{,-python3})
source=("git+https://github.com/$_pkgname/$_pkgname.git"
        "gvim.desktop")
sha256sums=("SKIP"
            "97e94c3ca5825d6ab50096eb8449adf1b05c88ad13e60e6a99be8daacc797eac")

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {

    # set global configuration files to /etc/[g]vimrc
    sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' $_pkgname/src/feature.h

}

build() {

    cd $_pkgname
    ./configure \
      --enable-fail-if-missing \
      --with-compiledby='Arch Linux AUR' \
      --prefix=/usr \
      --enable-gui=gtk2 \
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

    # actual installation
    cd $_pkgname
    make DESTDIR=$pkgdir install

    # desktop entry file and corresponding icon
    install -D -m644 ../gvim.desktop      $pkgdir/usr/share/applications/gvim.desktop
    install -D -m644 runtime/vim48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/gvim.png

    # remove ex/view and man pages (normally provided by package 'vi' on Arch Linux)
    cd $pkgdir/usr/bin ; rm ex view
    find $pkgdir/usr/share/man -type d -name 'man1' 2>/dev/null | \
      while read _mandir; do
        cd ${_mandir}
        rm -f ex.1 view.1
      done

    # remove components provided by vim-runtime-git
    cd $pkgdir
    rm -R usr/share/vim

    # add license
    install -D -m644 $srcdir/$_pkgname/runtime/doc/uganda.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
