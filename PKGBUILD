# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: mesmer <mesmer@fisica.if.uff.br>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: TJM <tommy.mairo@gmail.com>

# Directly based off of the official package

pkgname=vim-clipboard
pkgver=8.2.3890
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor'
url='https://www.vim.org'
arch=('x86_64')
license=('custom:vim')
depends=('vim-runtime' 'gpm' 'acl' 'glibc' 'libxt' 'libgcrypt' 'zlib')
makedepends=('glibc' 'libgcrypt' 'gpm' 'python2' 'python' 'ruby' 'libxt' 'lua'
             'gawk' 'tcl' 'pcre' 'zlib')
optdepends=('python2: Python 2 language support'
            'python: Python 3 language support'
            'ruby: Ruby language support'
            'lua: Lua language support'
            'perl: Perl language support'
            'tcl: Tcl language support')
conflicts=('vim' 'gvim' 'vim-minimal' 'vim-python3')
provides=('xxd' 'vim' 'vim-minimal' 'vim-python3' 'vim-plugin-runtime')
replaces=('vim' 'vim-python3' 'vim-minimal' 'gvim')
source=(https://github.com/vim/vim/archive/v${pkgver}/vim-${pkgver}.tar.gz)
sha512sums=('4fe4973198c1ec5cf0d5783d9cb0a7472cf954815678583318665bfe28ad40be3051f5583f73bbf332d928844752b9cc959c266776d2700dbc8748dac36e1a04')

prepare() {
  cd vim-${pkgver}/src
  # define the place for the global vimrc file (set to /etc/vimrc)
  sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
  sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
  autoconf
}

build() {
  cd vim-${pkgver}
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
    --enable-tclinterp=dynamic \
    --disable-canberra
  make
}

package() {
  cd vim-${pkgver}
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd "${_mandir}"
    rm -f ex.1 view.1 # provided by (n)vi
    rm -f evim.1    # this does not make sense if we have no GUI
  done

  # Runtime provided by runtime package
  rm -r "${pkgdir}"/usr/share/vim

  # remove gvim.desktop as not included
  rm "${pkgdir}"/usr/share/applications/gvim.desktop

  # license
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

# vim: ts=2 sw=2 et:
