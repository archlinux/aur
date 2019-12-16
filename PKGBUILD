# Maintainer: Egor Kovetskiy <e.kovetskiy@office.ngs.ru>
# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>
pkgbase='vim-git'
pkgname=('vim-git' 'vim-git-runtime')
pkgver=10985.5e5a98d7d
pkgrel=1
pkgdesc="VIM: Vi IMproved"
arch=('i686' 'x86_64')
url="http://github.com/vim/vim"
license=('GPL')
depends=('gpm' 'ruby' 'lua' 'python2' 'python' 'acl')
optdepends=()
backup=()
options=()
source=("git://github.com/vim/vim.git")
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

package_vim-git-runtime() {
  provides=('vim-runtime')
  conflicts=('vim-runtime')
  pkgdesc+=' (shared runtime)'
  optdepends=('sh: support for some tools and macros'
              'python: demoserver example tool'
              'gawk: mve tools upport')
  backup=('etc/vimrc')

  cd "$srcdir/vim"

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install
  # man and bin files belong to 'vim'
  rm -r "${pkgdir}"/usr/share/man/ "${pkgdir}"/usr/bin/

  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -dm 755 "${pkgdir}"/usr/share/licenses/vim-runtime
  ln -s /usr/share/vim/vim${_versiondir}/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim-runtime/license.txt
}

package_vim-git() {
  provides=('vim')
  conflicts=('vim')
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
