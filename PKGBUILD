# Maintainer: David Davis <davisd@davisd.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>


pkgname=('gvim-python3-noconflict')
pkgver=7.4.854
_versiondir=74
pkgrel=2
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://www.vim.org"
makedepends=('gpm' 'python2' 'python' 'ruby' 'libxt' 'desktop-file-utils' 'gtk2' 'lua')
source=(vim-$pkgver.tar.gz::http://github.com/vim/vim/archive/v$pkgver.tar.gz
        'launch-python-vim.sh'
        'launch-python-gvim.sh')
sha1sums=('SKIP'
          '386e86891915cc97d1acc5b08197fe5088e439b3'
          'af7d241e19235bcaa6ee7ee571c6b575236b3a45')

prepare() {
  cd vim-$pkgver

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
    src/feature.h

  (cd src && autoconf)

  cd "$srcdir"
  for pkg in ${pkgname[@]}
  do
    cp -a vim-$pkgver ${pkg}-build
  done

}

build() {

  cd "${srcdir}"/gvim-python3-noconflict-build

  ./configure \
    --prefix=/opt/gvim-python3-noconflict \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --enable-gui=gtk2 \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp \
    --disable-pythoninterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp

  make
}

check() {
  # disable tests because they seem to freeze

  cd "${srcdir}"/gvim-python3-noconflict-build

  #make test
}

package_gvim-python3-noconflict() {
  pkgdesc='Vi Improved, compiled with Python 3 support that can co-exist with the Arch maintained Python 2 compiled gvim package'
  depends=("vim-runtime>=${pkgver}-${pkgrel}" 'gpm' 'ruby' 'libxt'
           'desktop-file-utils' 'gtk2' 'lua' 'python' 'gvim')
  conflicts=('gvim-python3')
  install=gvim.install

  cd "${srcdir}"/gvim-python3-noconflict-build
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # python vim detection script
  install -Dm755 "${srcdir}"/launch-python-vim.sh \
    "${pkgdir}"/usr/bin/launch-python-vim.sh

  # python gvim detection script
  install -Dm755 "${srcdir}"/launch-python-gvim.sh \
    "${pkgdir}"/usr/bin/launch-python-gvim.sh
}

