# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: xantares

pkgbase=ipython-ipyparallel
pkgname=('ipython-ipyparallel' 'ipython2-ipyparallel')
pkgver=6.2.5
pkgrel=1
pkgdesc="Interactive Parallel Computing in Python"
url="https://github.com/ipython/ipyparallel"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=('openmpi: to use the MPI Launchers in ipcluster command')
source=("https://github.com/ipython/ipyparallel/archive/${pkgver}.tar.gz")
sha256sums=('f6de54a29f7beb97872aa49dfa606dea5f3ed20d2433e3a7200ac2ea9b2a4388')

prepare() {
  cp -a "${srcdir}/ipyparallel-$pkgver"{,-py2}
}

build() {
  cd "${srcdir}/ipyparallel-$pkgver"
  python setup.py build

  cd "${srcdir}/ipyparallel-$pkgver-py2"
  python2 setup.py build
}

package_ipython-ipyparallel() {
  depends=('ipython' 'python-setuptools')
  conflicts=('ipython2-ipyparallel')

  cd "${srcdir}/ipyparallel-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir/usr/etc" "$pkgdir/etc"
}

package_ipython2-ipyparallel() {
  depends=('ipython2' 'python2-setuptools')
  conflicts=('ipython-ipyparallel')

  cd "${srcdir}/ipyparallel-$pkgver-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir/usr/etc" "$pkgdir/etc"
  mv "${pkgdir}"/usr/bin/ipcluster "${pkgdir}"/usr/bin/ipcluster2
  mv "${pkgdir}"/usr/bin/ipcontroller "${pkgdir}"/usr/bin/ipcontroller2
  mv "${pkgdir}"/usr/bin/ipengine "${pkgdir}"/usr/bin/ipengine2
}
