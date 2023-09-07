# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: mesmer <mesmer@fisica.if.uff.br>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: TJM <tommy.mairo@gmail.com>

# Directly based off of the official package

pkgname=vim-clipboard
pkgver=9.0.1882
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor'
url='https://www.vim.org'
arch=('x86_64' 'x86_64_v3')
license=('custom:vim')
depends=('vim-runtime' 'gpm' 'acl' 'glibc' 'libxt' 'libgcrypt' 'zlib')
makedepends=('glibc' 'libgcrypt' 'gpm' 'python' 'ruby' 'libxt' 'lua'
             'gawk' 'git' 'tcl' 'zlib')
optdepends=('python: Python language support'
            'ruby: Ruby language support'
            'lua: Lua language support'
            'perl: Perl language support'
            'tcl: Tcl language support')
conflicts=('vim' 'gvim' 'vim-minimal')
provides=('xxd' 'vim' 'vim-minimal' 'vim-plugin-runtime')
replaces=('vim' 'vim-minimal' 'gvim')
source=(git+https://github.com/vim/vim.git?signed#tag=v${pkgver})
sha512sums=('SKIP')
validpgpkeys=('4F19708816918E19AAE19DEEF3F92DA383FDDE09') # Christian Brabandt <cb@256bit.org>

prepare() {
  cd vim/src
  # define the place for the global vimrc file (set to /etc/vimrc)
  sed -E 's|^.*(#define SYS_.*VIMRC_FILE.*").*$|\1|g' -i feature.h
  sed -E 's|^.*(#define VIMRC_FILE.*").*$|\1|g' -i feature.h
  autoconf
}

build() {
  cd vim
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
    --enable-python3interp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-luainterp=dynamic \
    --enable-tclinterp=dynamic \
    --disable-canberra
  make
}

package() {
  cd vim
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
