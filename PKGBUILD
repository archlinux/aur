# -*- sh -*-
# vim: ft=shell

# Maintainer: ncoif <ncoif@gmx.com>
# Contributor: Allen Li <darkfeline@felesatra.moe>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgbase=vim
pkgname=vim-x11
pkgver=8.0.0329
_versiondir=74
pkgrel=1
_upstream_pkgrel=1
arch=('i686' 'x86_64')
license=('custom:vim')
url='http://www.vim.org'
makedepends=('gpm' 'python2' 'python' 'ruby' 'libxt' 'lua' 'gawk' 'tcl')
source=("vim-$pkgver.tar.gz::http://github.com/vim/vim/archive/v$pkgver.tar.gz"
        'vimrc'
        'archlinux.vim')
sha1sums=('162d2876a612da32ce099e05d2f05a201043617a'
          'b8ca9132826e53cd14431ef9767e4fd820faa782'
          '94f7bb87b5d06bace86bc4b3ef1372813b4eedf2')

pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor (X11 support, no GUI)'
depends=("vim-runtime=${pkgver}-${_upstream_pkgrel}" 'gpm' 'acl')
optdepends=('python2: Python 2 language support'
            'python: Python 3 language support'
            'ruby: Ruby language support'
            'lua: Lua language support'
            'perl: Perl language support'
            'tcl: Tcl language support')
conflicts=('vim-minimal' 'vim' 'vim-python3' 'gvim' 'gvim-python3')
provides=("vim=${pkgver}-${_upstream_pkgrel}" 'xxd')

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

  cd "${srcdir}"/vim-x11-build

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

package() {
  cd "${srcdir}"/vim-x11-build
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
