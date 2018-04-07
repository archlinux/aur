# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf
pkgname=('python-asdf' 'python2-asdf' 'python-asdf-doc')
pkgver=1.3.3
pkgrel=1
pkgdesc="A Python tool for reading and writing Advanced Scientific Data Format (ASDF) files"
arch=('i686' 'x86_64')
url="https://asdf.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python>=3.3'
             'python2>=2.7'
             'cython'
             'cython2'
             'python-numpy>=1.6'
             'python-jsonschema>=2.3.0'
             'python-yaml>=3.10'
             'python-six>=1.9.0'
             'python-matplotlib'
             'python-astropy>=1.1'
             'python-astropy-helpers'
             'python2-astropy-helpers'
             'python-semantic-version'
             'python-sphinx')
#checkdepends=('python-pytest' 'python2-pytest' 'python2-jsonschema>=2.3.0' 'python2-yaml>=3.10' 'python2-six>=1.9.0' 'python2-semantic-version')
source=("https://files.pythonhosted.org/packages/source/a/asdf/asdf-${pkgver}.tar.gz")
md5sums=('669966205938a85dd28ced78633d400b')

prepare() {
    cd ${srcdir}/asdf-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/asdf-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/asdf-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/asdf-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check(){
#    cd ${srcdir}/asdf-${pkgver}
#    python setup.py test
#
#    cd ${srcdir}/asdf-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-asdf() {
    depends=('python2>=2.7' 'python2-numpy>=1.6' 'python2-jsonschema>=2.3.0' 'python2-yaml>=3.10' 'python2-six>=1.9.0')
    optdepends=('python2-astropy>=1.1: Support for units, time, transform, wcs, or running the tests'
                'python-asdf-doc: Documentation for Python-ASDF'
                'python2-pytest : For testing')
    cd ${srcdir}/asdf-${pkgver}-py2

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/asdftool{,2}
}

package_python-asdf() {
    depends=('python>=3.3' 'python-numpy>=1.6' 'python-jsonschema>=2.3.0' 'python-yaml>=3.10' 'python-six>=1.9.0')
    optdepends=('python-astropy>=1.1: Support for units, time, transform, wcs, or running the tests'
                'python-asdf-doc: Documentation for Python-ASDF'
                'python-pytest: For testing')
    cd ${srcdir}/asdf-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-asdf-doc() {
    pkgdesc="Documentation for Python ASDF module"
    cd ${srcdir}/asdf-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
