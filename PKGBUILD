# Maintainer: Nikita Sivakov <cryptomaniac.512@gmail.com>
# Contributor: Nikita Sivakov <cryptomaniac.512@gmail.com>

pkgname=vim-pydyn-xclip
pkgver=7.4.1689
_versiondir=74
pkgrel=2
pkgdesc='Vi Improved with dynamic python (python/dyn, python3/dyn) and clipboard support'
arch=(i686 x86_64)
url='http://www.vim.org'
license=('custom:vim')
depends=("vim-runtime" 'gpm' 'ruby' 'lua' 'python' 'python2' 'acl')
makedepends=(gpm python2 python ruby libxt lua)
provides=("vim" "vim-python3" "xxd")
conflicts=('vim-minimal' 'vim' 'vim-python3' 'gvim' 'gvim-python3')
source=(vim-$pkgver.tar.gz::http://github.com/vim/vim/archive/v$pkgver.tar.gz
        vimrc
        archlinux.vim)
sha1sums=('9fdd5cadca97baabc475b154f249b4b8d03fff07'
          '15ebf3f48693f1f219fe2d8edb7643683139eb6b'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2')

prepare() {
  cd vim-$pkgver

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h

  (cd src && autoconf)
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
    --enable-perlinterp \
    --enable-pythoninterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp

  make
}

check() {
  # disable tests because they seem to freeze
  cd "${srcdir}"/vim-$pkgver
  #make test
}

package() {

  cd "${srcdir}"/vim-$pkgver
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

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

  # license
  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
