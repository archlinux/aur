# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pyspeckit
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0.1
pkgrel=1
pkgdesc="Toolkit for fitting and manipulating spectroscopic data in python"
arch=('any')
url="https://pyspeckit.readthedocs.io"
license=('MIT' 'BSD')
makedepends=('python-setuptools'
             'python-astropy'
             'python-astropy-helpers>=3.1'
             'python-sphinx-astropy')
checkdepends=('python-pytest-astropy' 'tk' 'python-spectral-cube' 'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        )
md5sums=('c99b5d87854f0739f7777758e1f414d0')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    ln -rs ${srcdir}/${_pyname}-${pkgver}/{${_pyname}/tests/*.fits,}
    ln -rs ${srcdir}/${_pyname}-${pkgver}/{${_pyname}/tests/*.txt,}
    ln -rs ${srcdir}/${_pyname}-${pkgver}/{${_pyname}/tests/wav2rgb.py,}
    sed -i "/import\ idlsave/c from scipy.io import readsav as idlsave" ${_pyname}/spectrum/readers/alfalfa.py
    rm -r astropy_helpers
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"

}

package_python-pyspeckit() {
    depends=('python-astropy' 'python-matplotlib>=1.4')
    optdepends=('hdf5'
                'python-atpy'
                'python-scipy'
                'python-spectral-cube'
                'python-lmfit'
                'python-pyspeckit-doc: Documentation for PySpecKit')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README*
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-pyspeckit-doc() {
    pkgdesc="Documentation for Python PySpecKit module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
