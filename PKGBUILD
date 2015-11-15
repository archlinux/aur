# $Id$
# Maintainer: Babacar Tall <babacar.tall@gmail.com>

pkgbase=python-uhashring
pkgname=('python-uhashring' 'python2-uhashring')
pkgver=0.4
pkgrel=2
pkgdesc="Full featured consistent hashing python library compatible with ketama"
arch=('any')
url="https://github.com/ultrabug/uhashring"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=("https://pypi.python.org/packages/source/u/uhashring/uhashring-${pkgver}.tar.gz"
        "${pkgbase}-${pkgver}.patch"
        "tox.ini")
md5sums=('3ec9b158187ebdb63ea3295fa7a4eac0'
         '02062405a03ff4c814a12c518e82e3c2'
         '16b7aff12d15c2832a847a6a783a3d13')


prepare() {
    local path_of_uhashring_python="$srcdir/uhashring-$pkgver"
    local path_of_uhashring_python2="$srcdir/uhashring-$pkgver-py2"

    cp -a $path_of_uhashring_python $path_of_uhashring_python2

    # Prepare package_python-uhashring
    # ----------------------------------------------------------------------

    # This file is not included in the package, but it is necessary for the
    # testing.
    install -v -m0644 tox.ini $path_of_uhashring_python

    # Apply a patch python-uhashring.patch for three reasons:
    # 1 - tests/*: the unittests are not compatible with python35 (SyntaxError)
    # 2 - setup.py: AttributeError: can't set attribute
    #               https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=801726
    # 3 - tox.ini: In the classifiers (see the setup.py), it appear that the
    #              package is compatible with python3.5 but it seem forget in
    #              the section envtest of tox.ini
    install -v -m0644 "${pkgbase}-${pkgver}.patch" $path_of_uhashring_python
    pushd $path_of_uhashring_python
        patch --verbose -p0 -i "${pkgbase}-${pkgver}.patch"
    popd

    # Prepare package_python2-uhashring
    # ----------------------------------------------------------------------
    cp -v tox.ini $path_of_uhashring_python2
    pushd $path_of_uhashring_python2
        sed -i -e 's/commands=py.test/commands=py.test2/' tox.ini
    popd
}

build() {
    cd "$srcdir"/uhashring-$pkgver
    python setup.py build

    cd "$srcdir"/uhashring-$pkgver-py2
    python2 setup.py build
}

check() {
    cd "$srcdir"/uhashring-$pkgver
    python setup.py test

    cd "$srcdir"/uhashring-$pkgver-py2
    python2 setup.py test

}

package_python-uhashring() {
    cd "$srcdir"/uhashring-$pkgver
    python setup.py install --skip-build --optimize=1 --root="$pkgdir"
    install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-uhashring() {
    cd "$srcdir"/uhashring-$pkgver-py2
    python2 setup.py install --skip-build --optimize=1 --root="$pkgdir"
    install -m0644 -D "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
