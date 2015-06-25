# Maintainer : Simon Désaulniers <rostydela@gmail.com>

pkgname=pyclewn2
pkgver=2.1
pkgrel=1
pkgdesc="A python2 version of gdb support for vim"
license=('GPL2')
arch=(i686 x86_64)
url="http://pyclewn.sourceforge.net/"
depends=('python2' 'python2-trollius' 'python2-pdb-clone' 'gvim>=7.4' 'gdb')
install=${pkgname}.install
source=("https://pypi.python.org/packages/source/p/${pkgname%2}/${pkgname%2}-${pkgver}.tar.gz")
sha256sums=('4e6dccb6afa07e34202cc8cba4fc63a53d432b2dbc3f1a08c1945bbdd2a2a855')

_vimversion=$(vim --version | head -n 1 | gawk '{print $5}')

prepare () {
  #default python interpreter has to be python2.7
  sed -i -e 's/let s:python = "python"/let s:python = "python2.7"/' \
         -e 's/* pyclewn_python: "python"/* pyclewn_python: "python2.7"/' \
    $srcdir/${pkgname%2}-${pkgver}/lib/clewn/runtime/${pkgname%2}-${pkgver}.vmb
}

package() {
  cd $srcdir/${pkgname%2}-$pkgver

  python2.7 setup.py install --root=$pkgdir
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname%2}/README"

  #installing the vimball
  install -d "${pkgdir}/usr/share/vim/vimfiles"
  vim -c "let g:vimball_home = \"${pkgdir}/usr/share/vim/vimfiles\"" \
    -S ./lib/clewn/runtime/${pkgname%2}-${pkgver}.vmb -c "q" < /dev/tty > /dev/tty
  # fix vimball garbage
  rm "${pkgdir}/usr/share/vim/vimfiles/doc/tags"
  sed -ri "s|${pkgdir}||g" "${pkgdir}/usr/share/vim/vimfiles/.VimballRecord"
}
# vim:tw=80: sw=2: ts=2:
