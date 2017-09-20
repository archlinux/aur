# Maintainer: mesmer <mesmer@fisica.if.uff.br>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: TJM <tommy.mairo@gmail.com>

pkgbase=vim-clipboard
pkgname=(vim-clipboard)
pkgver=8.0.1092
_versiondir=80
pkgrel=1
arch=(i686 x86_64)
license=('custom:vim')
cores=$(nproc --all)
url='http://www.vim.org'
makedepends=(gpm python2 python ruby libxt gtk3 lua gawk tcl)
source=(vim-$pkgver.tar.gz::https://github.com/vim/vim/archive/v$pkgver.tar.gz
        vimrc
        archlinux.vim
        )
sha1sums=('3a7e6e8a5a592df8a3afed0d247c5c3b94fb75a5'
          '15ebf3f48693f1f219fe2d8edb7643683139eb6b'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2')
prepare() {
  cd $srcdir/vim-$pkgver/src

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' feature.h

  autoconf

  cd "$srcdir"
  cp -a vim-$pkgver gvim-$pkgver
}

build() {
  cd "${srcdir}"/vim-$pkgver
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
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-luainterp=dynamic \
    --enable-tclinterp=dynamic
  make -j$cores
}

package_vim-clipboard() {
  pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl')
  optdepends=('python2: Python 2 language support'
              'python: Python 3 language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  conflicts=('vim-minimal' 'vim-python3' 'vim')
  provides=('xxd' 'vim-minimal' 'vim-python3' 'vim')
  replaces=('vim-python3' 'vim-minimal' 'vim')

  cd "${srcdir}"/vim-$pkgver
  make -j$cores VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 # provided by (n)vi
    rm -f evim.1    # this does not make sense if we have no GUI
  done

  # Runtime provided by runtime package
  rm -r "${pkgdir}"/usr/share/vim

  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

