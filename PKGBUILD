# Maintainer: Mikhail Burakov <mikhail.burakov gmail com>

pkgname=vim-nox
pkgver=master
pkgrel=0
arch=('i686' 'x86_64')
license=('custom:vim')
url='http://www.vim.org'
depends=('gpm')
makedepends=('python2')
provides=('vim')
conflicts=('vim' 'vim-runtime')
pkgdesc='Vi Improved, console-only build with python2 support. Latest version from git.'
source=("git://github.com/vim/vim")
md5sums=('SKIP')

build() {
  cd "${srcdir}/vim/src"
  autoconf
  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Mikhail Burakov' \
    --enable-gpm \
    --enable-acl \
    --with-x \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --disable-netbeans \
    --enable-perlinterp \
    --enable-pythoninterp \
    --disable-python3interp \
    --disable-rubyinterp \
    --disable-luainterp
  make
}

package() {
  cd "${srcdir}/vim"
  make -j1 DESTDIR="${pkgdir}" install

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 # provided by (n)vi
    rm -f evim.1    # this does not make sense if we have no GUI
  done

  # license
  install -Dm644 "${srcdir}/vim/runtime/doc/uganda.txt" \
    "${pkgdir}/usr/share/licenses/vim/license.txt"
}
