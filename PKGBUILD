# Maintainer: Nikita Sivakov <cryptomaniac.512@gmail.com>
# Contributor: Nikita Sivakov <cryptomaniac.512@gmail.com>

pkgname=vim-pydyn-xclip
pkgver=8.0.0013
_versiondir=80
pkgrel=1
pkgdesc='Vi Improved with dynamic python (python/dyn, python3/dyn) and clipboard support'
arch=(i686 x86_64)
url='http://www.vim.org'
license=('custom:vim')
depends=("vim-runtime>=${pkgver}" 'gpm' 'acl')
makedepends=(gpm python2 python ruby libxt lua gawk tcl)
optdepends=('python2: Python 2 language support'
            'python: Python 3 language support'
            'ruby: Ruby language support'
            'lua: Lua language support'
            'perl: Perl language support'
            'tcl: Tcl language support')
provides=('vim' 'vim-python3' 'xxd')
conflicts=('vim-minimal' 'vim' 'vim-python3' 'gvim' 'gvim-python3')
replaces=('vim-python3' 'vim-minimal' 'gvim-python3')
source=(vim-$pkgver.tar.gz::http://github.com/vim/vim/archive/v$pkgver.tar.gz
        vimrc
        archlinux.vim)
sha1sums=('605be1eddc4501aea7c83b72a63b9ade6da5d43b'
          '0612c9d685ca7bb3b7bad8ebb9eaaefd5e724376'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2')

prepare() {
  cd vim-$pkgver/src

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' feature.h

  autoconf

  cd "$srcdir"
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

  make
}

check() {
  cd "${srcdir}"/vim-$pkgver
  TERM=xterm make -j1 test
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


  # no desktop files and icons
  rm -r "${pkgdir}"/usr/share/{applications,icons}

  # license
  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
