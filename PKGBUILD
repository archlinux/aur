# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: mesmer <mesmer@fisica.if.uff.br>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: TJM <tommy.mairo@gmail.com>

# Directly based off of the official package

pkgname=vim-clipboard
pkgver=9.0.1678
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor'
url='https://www.vim.org'
arch=('x86_64')
license=('custom:vim')
depends=('vim-runtime' 'gpm' 'acl' 'glibc' 'libxt' 'libgcrypt' 'zlib' 'perl')
makedepends=('glibc' 'libgcrypt' 'gpm' 'python' 'ruby' 'libxt' 'lua'
             'gawk' 'tcl' 'zlib')
optdepends=('python: Python language support'
            'ruby: Ruby language support'
            'lua: Lua language support'
            #'perl: Perl language support'
            'tcl: Tcl language support')
conflicts=('vim' 'gvim' 'vim-minimal')
provides=('xxd' 'vim' 'vim-minimal' 'vim-plugin-runtime')
replaces=('vim' 'vim-minimal' 'gvim')
source=(https://github.com/vim/vim/archive/v${pkgver}/vim-${pkgver}.tar.gz
        fix-perl-build.patch)
sha512sums=('c5ffb7ca56ff4eee70f06599dd84db2eb28ddadac229d4f7faf01174805923636a4ce61486bdf5a47910c929613dc9b9290dfc9288006222b4bc4ac891548bb8'
            '184dd232db5b4a346e9751e58ad0a9b2f60d50d1a2aa2050415d288445606d80c239745f0d8987ff822d2acf6826104a81f8e59c8f1785095d1f319c0fe4abf0')

prepare() {
  cd vim-${pkgver}/src
  patch -Np2 -i ../../fix-perl-build.patch
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
