# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>
# Packager: Adrian Bacircea <adrian.bacircea@gmail.com>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=p4python
pkgname=python-p4python
pkgver=2018.2.1743033
p4apiver=2018.1.1957529
pkgrel=2
pkgdesc="Interface to Perforce API for Python 3"
url="https://www.perforce.com/perforce/doc.current/manuals/p4script/03_python.html"
arch=('any')
license=('custom')
source=($pkgname-$pkgver.tar.gz::"https://files.pythonhosted.org/packages/36/5a/0a1b192cdecd31cb8bc0d0ba39c73ffd84ce823053d0004823a1fdbe1440/p4python-2018.2.1743033.tar.gz"
        'http://ftp.perforce.com/perforce/r18.1/bin.linux26x86_64/p4api.tgz')
sha256sums=('caa37ea520566f50181b042a474eb8012ff8dcbcc0512874170ad34bea1ba0c0'
  '331fad2257e4c427e1f864032f8125821865f2ecad3c643574cf4157f9ca7295')
makedepends=('python-setuptools')
depends=('openssl-1.0' 'python')

prepare() {
  # Clean up if needed
  rm -rf python-$_pkgsrcname-$pkgver

  sed -i 's/OpenSSL (\\d)\\.(\\d)\\.(\\d)(\\S+)\\s+\\d+ \\S+ \\d+/OpenSSL (\\d)\\.(\\d)\\.(\\d)(.*)/g' \
          ${_pkgsrcname}-${pkgver}/setup.py
  sed -i 's/pattern.match(version_string)/pattern.search(version_string)/g' \
          ${_pkgsrcname}-${pkgver}/setup.py

  # Copy folder, so we can cleanly build for both python versions
  mv $_pkgsrcname-$pkgver python-$_pkgsrcname-$pkgver

  cd ${srcdir}
  tar -xf p4api.tgz
}

build() {
  cd python-$_pkgsrcname-$pkgver
  python setup.py build \
          --ssl '/usr/lib/openssl-1.0' \
          --apidir ${srcdir}/p4api-${p4apiver}
}

package() {
  cd $srcdir/python-$_pkgsrcname-$pkgver

  python setup.py install --root="$pkgdir/" --skip-build --optimize=1 \
                          --apidir ${srcdir}/p4api-${p4apiver}
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
