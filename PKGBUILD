# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-spherical_geometry
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.2.8
pkgrel=1
pkgdesc="Python based tools for spherical geometry"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/resources/software_hardware/stsci_python"
license=('BSD')
makedepends=('python-setuptools' 'qd>=2.3.7' 'python-astropy>=3.1' 'python-astropy-helpers>=3.1' 'python-sphinx-astropy')
checkdepends=('python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_doc_warning.patch'
        'fix_testing.patch')
md5sums=('fba216fed5b504c8470b40afda5140a7'
         'a758662c8183e7769432aa1ad3691d49'
         '56f626fd4602e44528f7ef2521dc17d6')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    patch -Np1 -i "${srcdir}/fix_doc_warning.patch"
    patch -Np1 -i "${srcdir}/fix_testing.patch"
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

package_python-spherical_geometry() {
    depends=('python>=3.5' 'python-numpy>=1.10.0' 'qd>=2.3.7' 'python-astropy>=0.4')
    optdepends=('python-spherical_geometry-doc: Documentation for Spherical Geometry Toolkit'
                'python-pytest-astropy: For testing suite')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-spherical_geometry-doc() {
    pkgdesc="Documentation for Python Spherical Geometry Toolkit"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
