# Maintainer: Brenton Horne (fusion809) <brentonhorne77 at gmail dot com>

_pkgname=vim
pkgname=gvim-gtk2
pkgver=8.1.0611
pkgrel=1
pkgdesc="Vim, the text editor. CLI version and GTK2 GUI providing majority of features."
arch=("i686" "x86_64")
url="http://www.vim.org"
license=("custom:vim")
depends=("libxt" "gawk" "gtk2" "tcsh" "gpm")
optdepends=("lua: Lua interpreter" "perl: Perl interpreter" 
            "python: Python 3 interpreter"
            "python2: Python 2 interpreter" 
            "ruby: Ruby interpreter")
makedepends=("git" "libxt" "lua" "python2" "python" "ruby")
provides=("gvim=$pkgver" "xxd" "vim-runtime=$pkgver" "vim=$pkgver")
conflicts=("vim-minimal-git" "vim-git" "vim-runtime" "vim-runtime-git"
           "vim-minimal" "vim" "vim-python3" "gvim" "gvim-gtk3" "gvim-python3" "gvim-git")
source=("https://github.com/vim/vim/archive/v$pkgver.tar.gz"
        "vimrc"
        "archlinux.vim"
        "gvim.desktop")
backup=('etc/vimrc')
sha256sums=('SKIP'
            'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
            '0cf8b42732111d0c66c3908a76d832736e8f8dc3abef81cb092ddf84cb862ea2'
            '9f1c00aa96458caa2cdfc02164e58bc08bcfcbe5aa95dc618d2fc7e1b12b9a12')

prepare() {
    SRC="$srcdir/${_pkgname}-$pkgver"
    cd $SRC
    # set global configuration files to /etc/[g]vimrc
    sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h
    sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' src/feature.h
    cd src
    autoconf
    cd ..
    ./configure \
      --enable-fail-if-missing \
      --with-compiledby='Brenton Horne <brentonhorne77 at gmail dot com>' \
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
}

build() {
    SRC="$srcdir/${_pkgname}-$pkgver"
    cd $SRC
    make
}

package() {
    SRC="$srcdir/${_pkgname}-$pkgver"
    # actual installation
    cd $SRC
    make DESTDIR=$pkgdir install
    cd ..
    pv="${_pkgname}-$pkgver"

    # desktop entry file and corresponding icon
    install -Dm644 gvim.desktop      $pkgdir/usr/share/applications/gvim.desktop
    install -Dm644 $pv/runtime/vim48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/gvim.png

    # rc files
    install -Dm644 "${srcdir}"/vimrc "${pkgdir}"/etc/vimrc
    install -Dm644 "${srcdir}"/archlinux.vim \
      "${pkgdir}"/usr/share/vim/vimfiles/archlinux.vim

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

