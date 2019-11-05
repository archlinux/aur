# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>
# Packager: Adrian Bacircea <adrian.bacircea@gmail.com>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=p4python
pkgname=(python-p4python python2-p4python)
pkgver=2018.2.1743033
p4apiver=2018.1.1852931
pkgrel=2
pkgdesc="Interface to Perforce API for Python"
url="https://www.perforce.com/perforce/doc.current/manuals/p4script/03_python.html"
arch=('any')
license=('custom')
source=($pkgname-$pkgver.tar.gz::"https://files.pythonhosted.org/packages/36/5a/0a1b192cdecd31cb8bc0d0ba39c73ffd84ce823053d0004823a1fdbe1440/p4python-2018.2.1743033.tar.gz"
        'http://ftp.perforce.com/perforce/r18.1/bin.linux26x86_64/p4api.tgz')
sha256sums=('caa37ea520566f50181b042a474eb8012ff8dcbcc0512874170ad34bea1ba0c0'
            '169ad6a504e03c45e74477e2f0e2d8e3d4f2db36311270663d6d0bad57f6426a')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('openssl-1.0')

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
  python setup.py build \
          --ssl '/usr/lib/openssl-1.0' \
          --apidir ${srcdir}/p4api-${p4apiver}

  # Build for python 2
  cd ../python2-$_pkgsrcname-$pkgver
  python2 setup.py build \
          --ssl '/usr/lib/openssl-1.0' \
          --apidir ${srcdir}/p4api-${p4apiver}
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
