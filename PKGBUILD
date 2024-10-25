# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Contributor: Egor Kovetskiy <e.kovetskiy@office.ngs.ru>
# Contributor: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>
pkgbase='vim-git'
pkgname=('vim-git')
pkgver=r20350.de79f9129a
pkgrel=1
pkgdesc="VIM: Vi IMproved"
arch=('i686' 'x86_64')
url="https://www.vim.org/"
license=('GPL')
depends=('gpm' 'ruby' 'lua'  'python' 'acl')
optdepends=()
backup=()
options=()
source=("git+https://github.com/vim/vim.git")
md5sums=('SKIP')

pkgver() {
    cd "vim"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/vim"

    sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h
    sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' src/feature.h

    (cd src && autoconf)

    # with-x=yes provides FEAT_XCLIPBOARD which provides FEAT_CLIENTSERVER
    ./configure \
        --prefix=/usr \
        --localstatedir=/var/lib/vim \
        --with-features=huge \
        --with-compiledby='Arch Linux' \
        --enable-gpm \
        --enable-acl \
        --with-x=yes \
        --disable-gui \
        --enable-multibyte \
        --enable-cscope \
        --enable-netbeans \
        --enable-perlinterp \
        --enable-pythoninterp \
        --disable-python3interp \
        --enable-rubyinterp \
        --enable-luainterp

    make
}

package_vim-git() {
  provides=('vim' 'vim-plugin-runtime' 'xdd')
  conflicts=('vim' 'gvim')
  cd "$srcdir/vim"

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  rm "${pkgdir}"/usr/bin/{ex,view}

  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1
    rm -f evim.1
  done

  rm -r "${pkgdir}"/usr/share/vim

  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
md5sums=('SKIP')
