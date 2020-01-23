# Maintainer: peeweep <peeweep at 0x0 dot ee>
# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=pycharm-edu
pkgver=2019.3.1
_pkgver=2019.3.1
pkgrel=1
pkgdesc="Free, Easy & Professional Tool to Learn Programming with Python"
arch=('x86_64')
url="https://www.jetbrains.com/pycharm-edu/"
provides=('pycharm-edu')
license=('Apache')
depends=('giflib' 'ttf-font' 'libxtst' 'libxslt')
makedepends=('python2-setuptools' 'python-setuptools')
options=(!strip)
source=(https://download.jetbrains.com/python/$pkgname-$_pkgver.tar.gz
        'pycharm-edu.desktop')
optdepends=('ipython2: For enhanced interactive Python shell v2'
            'ipython: For enhanced interactive Python shell v3')
sha256sums=('e2fe28612a5148645074de9f52186678bfc331d89011ed01eac5ab5ecae52e10'
            '2934fbe579bcc3d6e9d66f9ee80286e36773fe59aafaef9d15bbb45a0a59c58b')

build() {
  cd pycharm-edu-$_pkgver

  # compile PyDev debugger used by PyCharm to speedup debugging
  python2 plugins/python-ce/helpers/pydev/setup_cython.py build_ext --build-temp build --build-lib .
  python3 plugins/python-ce/helpers/pydev/setup_cython.py build_ext --build-temp build --build-lib .
  
  rm -rf bin/fsnotifier{,-arm} lib/libpty/linux/x86
}
            
package() {
  # base
  install -dm 755 $pkgdir/opt/$pkgname
  cp -dr --no-preserve=ownership $srcdir/$pkgname-$_pkgver/* $pkgdir/opt/$pkgname
  install -dm 755 $pkgdir/usr/share/{applications,pixmaps}
  install -dm 755 $pkgdir/usr/bin/
  install -Dm 644 $pkgdir/opt/$pkgname/bin/pycharm.png $pkgdir/usr/share/pixmaps/$pkgname.png
  
  # licenses
  install -dm 755 $pkgdir/usr/share/licenses/$pkgname/
  cp -dr --no-preserve=ownership $srcdir/$pkgname-$_pkgver/license/* $pkgdir/usr/share/licenses/$pkgname
  
  # exec
  ln -s /opt/$pkgname/bin/pycharm.sh $pkgdir/usr/bin/$pkgname
  
  # app file desktop
  install -Dm 644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/
    
  # enable anti-aliasing text in pycharm options
  echo '-Dswing.aatext=true' >> $pkgdir/opt/$pkgname/bin/pycharm64.vmoptions
}
