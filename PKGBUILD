# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-asdf
pkgname=('python2-asdf' 'python2-asdf-doc')
pkgver=1.3.3
pkgrel=1
pkgdesc="A Python tool for reading and writing Advanced Scientific Data Format (ASDF) files"
arch=('i686' 'x86_64')
url="https://asdf.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python2>=2.7'
             'cython2'
             'python2-numpy>=1.6'
             'python2-jsonschema>=2.3.0'
             'python2-yaml>=3.10'
             'python2-six>=1.9.0'
             'python2-matplotlib'
             'python2-astropy>=1.1'
             'python2-astropy-helpers'
             'python2-semantic-version'
             'python2-sphinx')
#checkdepends=('python2-pytest')
source=("https://files.pythonhosted.org/packages/source/a/asdf/asdf-${pkgver}.tar.gz")
md5sums=('669966205938a85dd28ced78633d400b')

prepare() {
    cd ${srcdir}/asdf-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/asdf-${pkgver}
    python2 setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python2 setup.py build_docs
}

#check() {
#    cd ${srcdir}/asdf-${pkgver}
#    python2 setup.py test
#}

package_python2-asdf() {
    depends=('python2>=2.7' 'python2-numpy>=1.6' 'python2-jsonschema>=2.3.0' 'python2-yaml>=3.10' 'python2-six>=1.9.0' 'python2-semantic-version')
    optdepends=('python2-astropy>=1.1: Support for units, time, transform, wcs, or running the tests'
                'python2-asdf-doc: Documentation for Python-ASDF'
                'python2-pytest<3.7: For testing')
    cd ${srcdir}/asdf-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/asdftool{,2}
}

package_python2-asdf-doc() {
    pkgdesc="Documentation for Python ASDF module"
    cd ${srcdir}/asdf-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
