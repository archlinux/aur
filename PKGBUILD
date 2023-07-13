# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Nabil Freij <nabil.freij@gmail.com>

pkgbase=python-glymur
_pyname=${pkgbase#python-}
#_pyname=Glymur
pkgname=('python-glymur' 'python-glymur-doc')
pkgver=0.12.8
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
#             'openjpeg2'   # <- pillow <- skimage
              'python-scikit-image'
              'python-gdal')
#              'python-imagecodecs')
#source=("https://github.com/quintusdias/glymur/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://github.com/quintusdias/glymur/archive/refs/tags/v${pkgver/.p/p}.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://github.com/quintusdias/glymur/raw/master/tests/data/0220000800_uuid.dat"
#       "https://raw.githubusercontent.com/quintusdias/glymur/master/tests/data/issue555.xmp"
#       "https://github.com/quintusdias/glymur/raw/master/tests/data/issue549.dat"
#       "https://github.com/quintusdias/glymur/raw/master/tests/data/issue572.tif"
#       "https://github.com/quintusdias/glymur/raw/master/tests/data/issue982.j2k"
#       "https://github.com/quintusdias/glymur/raw/master/tests/data/uint16.j2k"
#       "https://github.com/quintusdias/glymur/raw/master/tests/data/basn6a08.tif"
#       "https://raw.githubusercontent.com/quintusdias/glymur/master/docs/source/whatsnew/0.10.rst"
#       "https://raw.githubusercontent.com/quintusdias/glymur/master/docs/source/whatsnew/0.11.rst"
#       "https://raw.githubusercontent.com/quintusdias/glymur/master/docs/source/whatsnew/0.12.rst")
md5sums=('7e7c752b2638ab1a711ca9b4b5ec6b01')
#        'SKIP'
#        'SKIP'
#        'SKIP'
#        'SKIP'
#        'SKIP'
#        'SKIP'
#        'SKIP'
#        'SKIP'
#        'SKIP'
#        'SKIP')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    ln -rs ${srcdir}/issue* tests/data
#    ln -rs ${srcdir}/0220* tests/data
#    ln -rs ${srcdir}/uint* tests/data
#    ln -rs ${srcdir}/basn* tests/data
#    ln -rs ${srcdir}/0.10.rst docs/source/whatsnew
#    ln -rs ${srcdir}/0.11.rst docs/source/whatsnew
#    ln -rs ${srcdir}/0.12.rst docs/source/whatsnew
#}

build() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/${_pyname}-${pkgver/.p/p}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir -p docs/source/_static
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/${_pyname}-${pkgver/.p/p}

    pytest || warning "Tests failed" # -vv --color=yes
#       tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian
#       tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian_stripped
#       tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian_tiled
}

package_python-glymur() {
#   cd ${srcdir}/${_pyname}-${pkgver}
    cd ${srcdir}/${_pyname}-${pkgver/.p/p}
    depends=('python-numpy' 'python-lxml' 'python-packaging')
    optdepends=('openjpeg2'
                'python-gdal'
                'python-scikit-image'
                'python-glymur-doc: Documentation for Python Glymur')

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-glymur-doc() {
    pkgdesc="Documentation for Python Glymur module"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs/build
    cd ${srcdir}/${_pyname}-${pkgver/.p/p}/docs/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
