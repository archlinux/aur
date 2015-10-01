# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-noruby
pkgver=7.4.884
_versiondir=74
pkgrel=1
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://www.vim.org"
pkgdesc="Like 'vim' package, but -ruby"
depends=("vim-runtime=${pkgver}-1" 'gpm' 'lua' 'python2' 'acl')
conflicts=('vim-minimal' 'vim-python3' 'gvim' 'gvim-python3' 'vim')
provides=("vim" "xxd")
makedepends=('gpm' 'python2' 'python' 'libxt' 'desktop-file-utils' 'lua')
source=("vim-${pkgver}.tar.gz::https://github.com/vim/vim/archive/v${pkgver}.tar.gz"
        'vimrc'
        'archlinux.vim')
sha1sums=('9ffcf8ac1207684c2165d6d4a821d01ad7b1fff5'
          '15ebf3f48693f1f219fe2d8edb7643683139eb6b'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2')

prepare() {
  cd vim-${pkgver}

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h

  (cd src && autoconf)

  cd ${srcdir}
  cp -a vim-${pkgver} ${pkgname}-build
}

build() {
  cd "${srcdir}/${pkgname}-build"

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=no \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp \
    --enable-pythoninterp \
    --disable-python3interp \
    --disable-rubyinterp \
    --enable-luainterp

  make
}

check() {
  # disable tests because they seem to freeze

  cd "${srcdir}/${pkgname}-build"

  #make test
}

package() {
  cd "${srcdir}/${pkgname}-build"

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

# vim:set sw=2 sts=2 et:
