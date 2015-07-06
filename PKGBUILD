# Contributor: Mike Redd <mredd -at- zerotuezero dot com>
# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>
# 
# Python3 patch provided by: Thaodan <theodorstormgrade@gmail.com>

pkgname=dropbox-index-svn
_pkgname=dropbox-index
_svntrunk=http://kosciak-misc.googlecode.com/svn/python/$_pkgname/trunk/
_svnmod=$_pkgname
pkgver=145
pkgrel=3
pkgdesc="Creates index.html for directory contents shared publicly on Dropbox. That way you can easily share whole content of the directory without the need to send separate links for all the shared files. "
arch=('i686' 'x86_64')
url=('http://code.google.com/p/kosciak-misc/wiki/DropboxIndex')
license=('Apache')
depends=('python' 'dropbox')
makedepends=('subversion')
provides=('$_pkgname')
conflicts=('dropbox-index')
source=('http://www.apache.org/licenses/LICENSE-2.0'
        'use_python3.patch')
md5sums=('3b83ef96387f14655fc854ddc3c6bd57'
         '64c39149c591419d8cb0d98aa47fb840')


build() {
  cd $srcdir
  mkdir -p ~/.subversion
  svn co $_svntrunk -r $pkgver $_svnmod
  cd $_svnmod/dropbox_index
  patch  -Np1 < $srcdir/use_python3.patch
}
package() { 
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/$_pkgname/
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  install -d $pkgdir/usr/share/$_pkgname
  cp -r $_pkgname/icons/ $pkgdir/usr/share/$_pkgname
  install -Dm655 $_pkgname/template-example.html $pkgdir/usr/share/$_pkgname/template-example.html
  install -Dm655 $srcdir/LICENSE-2.0 $pkgdir/usr/share/licenses/$_pkgname/LICENSE
  install -Dm755 $_pkgname/dropbox_index/__init__.py $pkgdir/usr/share/$_pkgname/$_pkgname.py
  # symlink to bin folder
  cd $pkgdir
  ln -s /usr/share/$_pkgname/$_pkgname.py $pkgdir/usr/bin/$_pkgname.py
}
