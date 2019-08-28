# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.sphinxext
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=1.2.1
pkgrel=1
pkgdesc="A set of tools and templates to customize Sphinx for use in STScI projects"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/institute/software_hardware/pyraf/stsci_python"
license=('BSD' 'LPPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-d2to1' 'python2-d2to1' 'python-stsci.distutils' 'python2-stsci.distutils')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix_new_sphinx.patch')
md5sums=('d23f6ad057a4af86a6ce3771bddb1754'
         'fafd43af38820f2c7ea301287909e16e')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
    patch -Np1 -i "${srcdir}/fix_new_sphinx.patch"

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
}

check() {
#   cd ${srcdir}/${_pyname}-${pkgver}
#   msg "Checking Python3"
#   python setup.py test

#   msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-stsci.sphinxext() {
    depends=('python2')
    optdepends=('python2-sphinx>=0.6.3'
                'python2-numpydoc: Provides support for Numpy-style docstring syntax'
                'python2-matplotlib: Provides matplotlib extensions for inline plotting')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-stsci.sphinxext() {
    depends=('python')
    optdepends=('python-sphinx>=0.6.3'
                'python-numpydoc: Provides support for Numpy-style docstring syntax'
                'python-matplotlib: Provides matplotlib extensions for inline plotting')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
