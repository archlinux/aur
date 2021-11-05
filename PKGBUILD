# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Nabil Freij <nabil.freij@gmail.com>

pkgbase=python-glymur
_pyname=Glymur
pkgname=('python-glymur' 'python-glymur-doc')
pkgver=0.9.6
pkgrel=1
pkgdesc="Tools for accessing JPEG2000 files"
arch=('any')
url="https://glymur.readthedocs.org"
license=('MIT')
makedepends=('python-setuptools' 'python-numpydoc' 'python-sphinx_rtd_theme')
checkdepends=('python-pytest' 'subversion' 'python-lxml' 'python-numpy' 'openjpeg2' 'python-gdal' 'python-scikit-image')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7d641cce63bc3adcddf4d3f389488232')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    mkdir docs/source/_static
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   svn export https://github.com/quintusdias/glymur/trunk/tests/data tests/data
    pytest || warning "Tests failed"
}

package_python-glymur() {
    cd ${srcdir}/${_pyname}-${pkgver}
    depends=('python-numpy' 'python-lxml' 'python-setuptools')
    optdepends=('openjpeg2'
                'python-gdal'
                'python-scikit-image'
                'python-glymur-doc: Documentation for Python Glymur')

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-glymur-doc() {
    pkgdesc="Documentation for Python Glymur module"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
