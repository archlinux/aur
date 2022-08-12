# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Nabil Freij <nabil.freij@gmail.com>

pkgbase=python-glymur
#_pyname=${pkgbase#python-}
_pyname=Glymur
pkgname=('python-glymur' 'python-glymur-doc')
pkgver=0.11.2
pkgrel=1
pkgdesc="Tools for accessing JPEG2000 files"
arch=('any')
url="https://glymur.readthedocs.org"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpydoc'
             'python-sphinx_rtd_theme')
checkdepends=('python-pytest'
              'python-numpy'
              'python-lxml'
              'openjpeg2'
              'python-scikit-image'
              'python-gdal')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://github.com/quintusdias/glymur/raw/master/tests/data/0220000800_uuid.dat"
        "https://raw.githubusercontent.com/quintusdias/glymur/master/docs/source/whatsnew/0.10.rst"
        "https://raw.githubusercontent.com/quintusdias/glymur/master/docs/source/whatsnew/0.11.rst"
        "https://raw.githubusercontent.com/quintusdias/glymur/master/tests/data/issue555.xmp"
        "https://github.com/quintusdias/glymur/raw/master/tests/data/issue549.dat"
        "https://github.com/quintusdias/glymur/raw/master/tests/data/issue982.j2k"
        "https://github.com/quintusdias/glymur/raw/master/tests/data/uint16.j2k")
md5sums=('f77ee725c4a755290caee5732f68afb2'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

get_pyver() {
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/issue* tests/data
    ln -rs ${srcdir}/0220* tests/data
    ln -rs ${srcdir}/uint* tests/data
    ln -rs ${srcdir}/0.10.rst docs/source/whatsnew
    ln -rs ${srcdir}/0.11.rst docs/source/whatsnew
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    mkdir source/_static
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-glymur() {
    cd ${srcdir}/${_pyname}-${pkgver}
    depends=('python-numpy' 'python-lxml' 'python-packaging' 'python-setuptools')
    optdepends=('openjpeg2'
                'python-gdal'
                'python-scikit-image'
                'python-glymur-doc: Documentation for Python Glymur')

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -r "${pkgdir}/usr/lib/python$(get_pyver)/site-packages/tests"/*
}

package_python-glymur-doc() {
    pkgdesc="Documentation for Python Glymur module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
