# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-radio_beam
_pname=${pkgbase#python-}
_pyname=${_pname/_/-}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.3.3
pkgrel=1
pkgdesc="A tool for manipulating and utilizing two dimensional gaussian beams within the astropy framework"
arch=('i686' 'x86_64')
url="https://radio-beam.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'python-astropy' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1a019b5fb8f3449710c028f777316e38')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/^version/c version = release = '${pkgver}'" docs/conf.py
}

build() {
    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
   cd ${srcdir}/${_pyname}-${pkgver}

   pytest "build/lib"
}

package_python-radio_beam() {
    depends=('python' 'python-astropy' 'python-six' 'python-scipy')
    optdepends=('python-pytest-astropy: For testing'
                'python-radio_beam-doc: Documentation for Radio Beam')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-radio_beam-doc() {
    pkgdesc="Documentation for Python Radio Beam module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
