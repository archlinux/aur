# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=pycharm-edu
pkgver=3.5.0
_pkgver=3.5
pkgrel=1
pkgdesc="Free, Easy & Professional Tool to Learn Programming with Python"
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/pycharm-edu/"
provides=('pycharm-edu')
license=('Apache')
depends=('java-runtime-common' 'java-runtime' 'giflib' 'ttf-font')
source=(https://download.jetbrains.com/python/$pkgname-$_pkgver.tar.gz
        'pycharm-edu.desktop')
optdepends=('ipython2: For enhanced interactive Python shell v2'
            'ipython: For enhanced interactive Python shell v3')
sha256sums=('46b90a3179313ea2fcb7956e174e2072d5164e2c6e17de718ff80089d6c891dc'
            '2934fbe579bcc3d6e9d66f9ee80286e36773fe59aafaef9d15bbb45a0a59c58b')

package() {
  # base
  cd $srcdir
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
    
  # delete some conflicts files for i686 
  if [[ $CARCH = 'i686' ]]; then
    rm -f $pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so
    rm -f $pkgdir/opt/$pkgname/bin/fsnotifier64
  fi
    
  # enable anti-aliasing text in pycharm options
  if [[ $CARCH = 'i686' ]]; then
    #echo '-Dawt.useSystemAAFontSettings=on' >> $pkgdir/opt/$pkgname/bin/pycharm.vmoptions
    echo '-Dswing.aatext=true' >> $pkgdir/opt/$pkgname/bin/pycharm.vmoptions
  else
    #echo '-Dawt.useSystemAAFontSettings=on' >> $pkgdir/opt/$pkgname/bin/pycharm64.vmoptions
    echo '-Dswing.aatext=true' >> $pkgdir/opt/$pkgname/bin/pycharm64.vmoptions
  fi
}
