# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-radio_beam
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}" "python-${_pyname}-doc")
pkgver=0.3.2
pkgrel=1
pkgdesc="A tool for manipulating and utilizing two dimensional gaussian beams within the astropy framework"
arch=('i686' 'x86_64')
url="https://radio-beam.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-astropy' 'python-astropy-helpers' 'python2-astropy-helpers' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy')
#'python2-pytest<3.7' 'python2-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9bf93952bcf371a0574df393a897fe89')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check() {
#   msg "Checking Python3"
#   cd ${srcdir}/${_pyname}-${pkgver}
#   python setup.py test
#
#   msg "Checking Python2"
#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
#}

package_python2-radio_beam() {
    depends=('python2' 'python2-astropy')
    optdepends=('python2-pytest32: For testing'
                'python-radio_beam-doc: Documentation for Radio Beam')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-radio_beam() {
    depends=('python' 'python-astropy')
    optdepends=('python-pytest-astropy: For testing'
                'python-radio_beam-doc: Documentation for Radio Beam')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-radio_beam-doc() {
    pkgdesc="Documentation for Python Radio Beam module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
