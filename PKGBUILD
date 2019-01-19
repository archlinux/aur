# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-imexam
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.8.1
pkgrel=1
pkgdesc="A package for functionality like IRAF's imexamine"
arch=('i686' 'x86_64')
url="https://imexam.readthedocs.io/"
license=('BSD' 'MIT')
makedepends=('cython' 'python-ginga' 'python-astropy-helpers>=3.1' 'python-sphinx-astropy' 'xpa')
checkdepends=('python-pytest-astropy' 'python-photutils')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'use_system_xpa.patch')
md5sums=('009489ebdcd6f3a66736b4035b7aa313'
         '2d4bc5f01b53f02a384dbc802d1d3ee5')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    patch -Np1 -i "${srcdir}/use_system_xpa.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-imexam() {
    depends=('python>=3.5' 'python-astropy' 'python-matplotlib')
    optdepends=('python-ginga: For Ginga viewer support'
                'xpa: For connection with DS9'
                'ds9: For DS9 viewer support'
                'python-photutils: For photometry features'
                'python-imexam-doc: Documentation for imexam')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/{LICENSE.rst,LICENSE_MIT.txt}
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-imexam-doc() {
    pkgdesc="Documentation for Python imexam module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
