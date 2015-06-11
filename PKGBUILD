# Maintainer : Lenin Lee <lenin.lee (at) gmail (dot) com >
# Contributor: LUO, Jian <jian (dot) luo (dot) cn (at) gmail (dot) com >
#              Ivan Sichmann Freitas <ivansichfreitas (at) gmail (dot) com>

pkgname=python-pyclewn
_pkgname=pyclewn
pkgver=2.1
pkgrel=1
pkgdesc="A Vim front-end to the gdb and pdb debuggers"
license=('GPL2')
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
depends=('python' 'gvim>=7.3' 'gdb')
install=vimdoc.install
source=(https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('e0ca9d863c443e8faec768e2978180db')

build() {
  cd $srcdir/$_pkgname-$pkgver
  mkdir tmp
  python setup.py install --prefix=/usr --root="$srcdir/$_pkgname-$pkgver/tmp" --optimize=1
  mv tmp/usr/lib/python3.4/site-packages/ clewn
  python -c "from clewn import clewn; clewn.get_vimball()"
  rm -rf clewn tmp
  echo ":let g:vimball_home = \"$pkgdir/usr/share/vim/vimfiles\"" > instcmd.txt
  echo ":e $_pkgname-$pkgver.vmb" >> instcmd.txt
  echo ":set nomore" >> instcmd.txt
  echo ":so %" >> instcmd.txt
  echo ":q!" >> instcmd.txt
  
       
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  vim -s instcmd.txt
  #vim -c "let g:vimball_home = \"$pkgdir/usr/share/vim/vimfiles\"" -S $_pkgname-$pkgver.vmb -c q
  rm -f "$pkgdir/usr/share/vim/vimfiles/doc/tags"
}
