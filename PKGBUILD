# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=p4python
pkgname=(python-p4python python2-p4python)
pkgver=2017.2.1615960
p4apiver=2018.1.1660568
pkgrel=1
pkgdesc="Interface to Perforce API for Python"
url="https://www.perforce.com/perforce/doc.current/manuals/p4script/03_python.html"
arch=('any')
license=('custom')
source=($pkgname-$pkgver.tar.gz::"https://files.pythonhosted.org/packages/37/2f/ae9214f6b08bde402d88a9cdf6faf307cfbe50fee04aeb4b15f89bf09fcd/p4python-2017.2.1615960.tar.gz"
        'http://ftp.perforce.com/perforce/r18.1/bin.linux26x86_64/p4api.tgz')
sha256sums=('316499580172a5ed5c873cc361cdd0ecda70bb36cffc2d84c189e53268a06312'
            'e1c9e08b4db0b333510ae814e316e506c48f7eb80b654367bed003096ea8a5ec')
makedepends=('python-setuptools' 'python2-setuptools')

prepare() {
  # Clean up if needed
  rm -rf python-$_pkgsrcname-$pkgver
  rm -rf python2-$_pkgsrcname-$pkgver

  sed -i 's/OpenSSL (\\d)\\.(\\d)\\.(\\d)(\\S+)\\s+\\d+ \\S+ \\d+/OpenSSL (\\d)\\.(\\d)\\.(\\d)(.*)/g' \
          ${_pkgsrcname}-${pkgver}/setup.py
  sed -i 's/pattern.match(version_string)/pattern.search(version_string)/g' \
          ${_pkgsrcname}-${pkgver}/setup.py

  # Copy folder, so we can cleanly build for both python versions
  mv $_pkgsrcname-$pkgver python-$_pkgsrcname-$pkgver
  cp -rup python-$_pkgsrcname-$pkgver python2-$_pkgsrcname-$pkgver

  cd ${srcdir}
  tar -xf p4api.tgz
}

build() {
  # Build for python 3
  cd python-$_pkgsrcname-$pkgver
  python setup.py build --apidir ${srcdir}/p4api-${p4apiver}

  # Build for python 2
  cd ../python2-$_pkgsrcname-$pkgver
  python2 setup.py build --apidir ${srcdir}/p4api-${p4apiver}
}

package_python-p4python() {
  depends=('python')
  pkgdesc+=" 3"

  cd $srcdir/python-$_pkgsrcname-$pkgver

  python setup.py install --root="$pkgdir/" --skip-build --optimize=1 \
                          --apidir ${srcdir}/p4api-${p4apiver}
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-p4python() {
  depends=('python2')
  pkgdesc+=" 2"

  cd $srcdir/python2-$_pkgsrcname-$pkgver

  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1 \
                           --apidir ${srcdir}/p4api-${p4apiver}
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
