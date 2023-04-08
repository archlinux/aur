# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-daemon
pkgver=2.3.0
pkgrel=5
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
depends=('python' 'python-lockfile' 'python-setuptools')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-wheel')
checkdepends=('python-testscenarios' 'python-testtools')
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz
        testtools-2.5.0.patch
        python310.patch)
sha256sums=('bda993f1623b1197699716d68d983bb580043cf2b8a66a01274d9b8297b0aeaf'
            '7f8dfbe9e01edcb19ebede5580d448a995b721ee3b56ca1d353f58c36416c980'
            '1777e34936ed5d45001e9994f563fdf8c9e2045b667223f1eebf896031627ddc')
b2sums=('6e7fa082a513827283f46044347dfd445633db0d1781a33aa1bc5b14c340da784310ae6bd07d6cf3673cd05cb14a9d090ab51857d26cca52d09bc8c3b195360f'
        'f794167aca806f608846e610b12a310f3e5a3ad9b426ab0b9069c92a552ea8817404f6ebfd6878257df6d346432c377471b377794948c3e341b40c296ab9dacb'
        'ffdf203815713a346ed0e35048aa8da886966625e1698b5362447e4733e68034efb078c150d698c7a253931aec930162f722e96ccaaa3fa84b2be0a8fee82341')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../testtools-2.5.0.patch
  patch -Np1 -i ../python310.patch

  # NOTE: twine is *not* required for building this package
  sed -e '/twine/d' -i setup.py
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m unittest discover -v
}

package_python-daemon() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
