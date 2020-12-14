# Maintainer: peeweep <peeweep at 0x0 dot ee>
# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Axel Navarro <navarroaxel at gmail.com>

pkgname=pycharm-edu
pkgver=2020.3
_pkgver=2020.3
pkgrel=1
pkgdesc="A Professional Tool to Learn and Teach Programming with Python"
arch=('x86_64')
url="https://www.jetbrains.com/pycharm-edu/"
provides=('pycharm-edu')
license=('Apache')
depends=('giflib' 'glibc' 'libxtst' 'libxslt' 'libdbusmenu-glib')
makedepends=('python-setuptools')
options=(!strip)
source=(https://download.jetbrains.com/python/$pkgname-$_pkgver.tar.gz
        'pycharm-edu.desktop')
optdepends=('ipython2: For enhanced interactive Python shell v2'
            'ipython: For enhanced interactive Python shell v3')
sha256sums=('8fd9f16ab2ebe39fb42d26473d226ad6d539511e8f3d61bb4b7f512c02131dff'
            'bb47c5ebe079539aed256aea205fdc91a425937744e6d84df65a85cdbd51ab59')

build() {
  cd "$pkgname-$_pkgver"

  # compile PyDev debugger used by PyCharm to speedup debugging
  python plugins/python-ce/helpers/pydev/setup_cython.py build_ext --build-temp build --build-lib .

  rm -rf bin/fsnotifier lib/libpty/linux/{mips64el,ppc64le,aarch64,x86}
  rm -rf Install-Linux-tar.txt help/ReferenceCardForMac.pdf
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
