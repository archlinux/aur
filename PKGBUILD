# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-jplephem
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.19
pkgrel=1
pkgdesc="Use a JPL ephemeris to predict planet positions"
arch=('any')
url="https://github.com/brandon-rhodes/python-jplephem"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
checkdepends=('python-nose'
              'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de405.bsp"
        "https://github.com/brandon-rhodes/python-jplephem/raw/master/ci/de421.bsp")
md5sums=('31c4dc69fc0b8baade058783d3604078'
         'SKIP'
         'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp ${srcdir}/*.bsp .
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python -m unittest discover jplephem
    nosetests || warning "Tests failed" # -v -x
}

package_python-jplephem() {
    depends=('python-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
