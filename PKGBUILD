# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: mesmer <mesmer@fisica.if.uff.br>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: TJM <tommy.mairo@gmail.com>

# Directly based off of the official package

pkgbase=vim-clipboard
pkgname=vim-clipboard
pkgver=8.2.2891
_versiondir=82
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor'
url='https://www.vim.org'
arch=('x86_64')
license=('custom:vim')
makedepends=('glibc' 'libgcrypt' 'gpm' 'python2' 'python' 'ruby' 'libxt' 'lua'
             'gawk' 'tcl' 'pcre' 'zlib')
source=(https://github.com/vim/vim/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz
        vimrc
        archlinux.vim
        vimdoc.hook)
sha256sums=('3d0a424f637e4920dc514b124782d7e1f29a7b819031924989ca69e231ee686a'
            'b16e85e457397ab2043a7ee0a3c84307c6b4eac157fd0b721694761f25b3ed5b'
            'cc3d931129854c298eb22e993ec14c2ad86cc1e70a08a64496f5e06559289972'
            '8e9656934d9d7793063230d15a689e10455e6db9b9fe73afa0f294792795d8ae')
sha512sums=('a16f73720925f59db305f149f5d9bdea9fb2a4a993e7c07d4e83fdca5617ebb17b2e63b77a0d2ea05f8014f14edb0a41e6be633d848b81fce36162a45c23ccca'
            '4b5bed0813f22af9e158ea9aa56a4a9862dd786ba2d201f20159ccf652da6190164aaed0b6b7217d578f7b25c33a8adcc307bfcf3caa8d173a7ff29e2a00fee7'
            'fe091d289d876f45319c898f6021ef86d6a238b540c225a279c46efc5c36fa7d868cd0cee73a111811c4be90df160f85340bb251be3a437727dbe5c699950363'
            'a02ad0d66f300160911aeb81d8886c6c558436ac4ee3fcd161dd65c6b1e5d1f41b9005a7f5bb5ba68d57027fc1c8e43daabf055bd6207fb5a216a67f758df8d1')

prepare() {
  cd vim-${pkgver}/src
  # define the place for the global (g)vimrc file (set to /etc/vimrc)
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
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm' 'acl' 'glibc' 'libgcrypt' 'pcre'
           'zlib')
  optdepends=('python2: Python 2 language support'
              'python: Python 3 language support'
              'ruby: Ruby language support'
              'lua: Lua language support'
              'perl: Perl language support'
              'tcl: Tcl language support')
  conflicts=('vim' 'gvim' 'vim-minimal' 'vim-python3')
  provides=('xxd' 'vim' 'vim-minimal' 'vim-python3' 'vim-plugin-runtime')
  replaces=('vim' 'vim-python3' 'vim-minimal' 'gvim')

  cd vim-${pkgver}
  make VIMRCLOC=/etc DESTDIR="${pkgdir}" install

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
