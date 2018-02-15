# Maintainer: Barry Smith <brrtsm at gmail dot com>
# Contributor: Viacheslav Chimishuk <voice@root.ua>

pkgname=python-pysvn
pkgver=1.9.5
pkgrel=1
pkgdesc="Python3 SVN Extension."
url="http://pysvn.tigris.org"
depends=('python>=3.1.3' 'subversion' 'apr')
conflicts=('pysvn<=1.7.4-3')
arch=('i686' 'x86_64')
license=('APACHE')
source=("http://pysvn.barrys-emacs.org/source_kits/pysvn-$pkgver.tar.gz")
md5sums=('afee06ac4d9e8fcaa2c8ad7804dc64b2')

build() {
  cd "$srcdir/pysvn-$pkgver/Source"
  python3 setup.py configure --norpath --verbose --pycxx-dir="../Import/pycxx-7.0.3" || return 1
  make
}

check() {
  cd "$srcdir/pysvn-$pkgver/Tests"
  # tests fail with latest subversion
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
