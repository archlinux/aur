# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python-fudge
pkgver=1.1.1
pkgrel=3
pkgdesc="Use fake objects (mocks, stubs, etc) to test real ones"
arch=(any)
url="http://farmdev.com/projects/fudge/"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-fudge-docs: documentation for Fudge')
source=("https://files.pythonhosted.org/packages/source/f/fudge/fudge-${pkgver}.tar.gz")
md5sums=('3aefdd12c3e0518665fe6735b24a0f9b')

prepare(){
    cd "$srcdir"/fudge-$pkgver

    # remove 2to3 conversion from setup.py (not supported anymore)
    sed -i '70d' setup.py

    # manual 2to3 conversion
    2to3 -w fudge/patcher.py
    2to3 -w fudge/tests/test_fudge.py
    2to3 -w fudge/tests/test_registry.py
}

package() {
  cd "$srcdir/fudge-$pkgver"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  #_pyver = $(python --version|cut -f2 -d" " |cut -d"." -f1,2)
  #echo ====>> $_pyver
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  ln -s /usr/lib/python${_pyver}/site-packages/fudge-${pkgver}.dist-info/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
