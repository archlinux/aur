# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname=('python-nexpy' 'python2-nexpy')
_pkgname=nexpy
pkgver=0.10.10
pkgrel=2
pkgdesc="NeXpy: A Python GUI to analyze NeXus data"
url="http://nexpy.github.io/nexpy"
arch=("any")
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-six' 'python2-six')
source=("https://github.com/nexpy/nexpy/archive/v${pkgver}.tar.gz")
md5sums=('43bfc04c709eb5b8605215ed182af716')

prepare() {
    cp -a "${srcdir}/$_pkgname-$pkgver"{,-py2}
}

package_python-nexpy() {
    depends=('python-numpy' 'python-h5py' 'python-scipy' 'python-nexusformat' 'jupyter' 'python-matplotlib' 'python-ansi2html')
    cd "$srcdir/$_pkgname-$pkgver"
    sed -i 's/jupyter/jupyter_core/' src/nexpy/requires.py # Can't find jupyter at run time
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-nexpy() {
    depends=('python2-numpy' 'python2-h5py' 'python2-scipy' 'python2-nexusformat' 'ipython2-notebook' 'python2-matplotlib' 'python2-subprocess32')
    cd "$srcdir/$_pkgname-$pkgver-py2"
    sed -i 's/jupyter/jupyter_core/' src/nexpy/requires.py # Can't find jupyter at run time
    sed -i '/ansi2html/d' src/nexpy/requires.py # remove ansi2html from requires
    python2 setup.py install --root="$pkgdir/" --optimize=1
    # Conflict with python3 version
    mv $pkgdir/usr/bin/nexpy{,2}
}
