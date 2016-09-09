# Maintainer: Viacheslav Chimishuk <voice@root.ua>

pkgname=python-pysvn
pkgver=1.9.3
pkgrel=1
pkgdesc="Python3 SVN Extension."
url="http://pysvn.tigris.org"
depends=('python>=3.1.3' 'subversion' 'apr')
conflicts=('pysvn<=1.7.4-3')
arch=('i686' 'x86_64')
license=('APACHE')
source=("http://pysvn.barrys-emacs.org/source_kits/pysvn-$pkgver.tar.gz"
        "configure.patch")
md5sums=('03bdded9f168ad80c9f7cbb73a07dd80'
         '1d87befcda9fffb39e436a48c36c4d41')

prepare() {
  cd "$srcdir/pysvn-$pkgver"

  patch -p1 -i ../configure.patch
}

build() {
  cd "$srcdir/pysvn-$pkgver/Source"
  python3 setup.py configure --norpath --verbose || return 1
  make
}

check() {
  cd "$srcdir/pysvn-$pkgver/Tests"
  LC_ALL="en_US.UTF-8" make
}

package() {
  _pyver=`python3 -V 2>&1|sed -e 's/.* 3\.\([0-9]\).*/\1/'`
  cd "$srcdir/pysvn-$pkgver/Source"
  install -Ddm755 "$pkgdir/usr/lib/python3.$_pyver/site-packages/pysvn/"
  install -Dm644 pysvn/__init__.py "$pkgdir/usr/lib/python3.$_pyver/site-packages/pysvn/__init__.py"
  install -Dm755 "pysvn/_pysvn_3_$_pyver.so" "$pkgdir/usr/lib/python3.$_pyver/site-packages/pysvn/_pysvn_3_$_pyver.so"
}
# vim: set ts=2 sw=2 et:
