# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Nabil Freij <nabil.freij@gmail.com>

pkgbase=python-glymur
_pyname=${pkgbase#python-}
#_pyname=Glymur
pkgname=('python-glymur' 'python-glymur-doc')
pkgver=0.14.4
#_pkgver=0.14.0post2
#_commit="d0134123978678d33573d53a144ce1634e770e10"
pkgrel=1
pkgdesc="Tools for accessing JPEG2000 files"
arch=('any')
url="https://glymur.readthedocs.org"
license=('MIT')
makedepends=('python-setuptools-scm>=8.0'
             'python-build'
             'python-installer'
             'python-numpydoc'
             'python-sphinx_rtd_theme'
             'python-lxml'
             'python-pillow')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
#             'openjpeg2'   # <- pillow <- skimage
              'python-scikit-image'
              'python-gdal')    # np <- skimage, lxml pillow already in makedepends
#              'python-imagecodecs')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#        "${pkgver}-conftest.py::https://github.com/quintusdias/glymur/raw/refs/tags/v${pkgver}/conftest.py"
#source=("https://github.com/quintusdias/glymur/archive/refs/tags/v${pkgver}.tar.gz"
#source=("https://github.com/quintusdias/glymur/archive/refs/tags/v${_pkgver}.tar.gz")
#        'fix-sphinx8-intersphinx.patch'
#source=("https://github.com/quintusdias/glymur/archive/refs/tags/v${pkgver/.p/p}.tar.gz")
#source=("${_pyname}-${pkgver}.tar.gz::https://github.com/quintusdias/glymur/archive/${_commit}.tar.gz")
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
md5sums=('4e59b06fb23efd3b713565ddd0ef4980')
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

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_pkgver}
#
#    ln -rs ${srcdir}/issue* tests/data
#    ln -rs ${srcdir}/0220* tests/data
#    ln -rs ${srcdir}/uint* tests/data
#    ln -rs ${srcdir}/basn* tests/data
#    ln -rs ${srcdir}/0.10.rst docs/source/whatsnew
#    ln -rs ${srcdir}/0.11.rst docs/source/whatsnew
#    ln -rs ${srcdir}/0.12.rst docs/source/whatsnew
#    ln -rs {${srcdir}/${pkgver}-,}conftest.py
#   patch -Np1 -i "${srcdir}/fix-sphinx8-intersphinx.patch"
#   sed -i "s/'MIT'/{ text = 'MIT' }/" pyproject.toml
    sed -e "/platform.system/s/linux/Linux/" -e "/os_release/s/and/or/" \
        -e "/os_release/s/id/ID/" -i tests/fixtures.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_pkgver}
#   cd ${srcdir}/${_pyname}-${pkgver/.p/p}
#   cd ${srcdir}/${_pyname}-${_commit}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir -p docs/source/_static
#   PYTHONPATH="${srcdir}/${_pyname}-${_pkgver}/build/lib" make -C docs html
    PYTHONPATH="build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_pkgver}
#   cd ${srcdir}/${_pyname}-${pkgver/.p/p}
#   cd ${srcdir}/${_pyname}-${_commit}

    pytest || warning "Tests failed" # -vv -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#       tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian
#       tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian_stripped
#       tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian_tiled
}

package_python-glymur() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_pkgver}
#   cd ${srcdir}/${_pyname}-${pkgver/.p/p}
#   cd ${srcdir}/${_pyname}-${_commit}
    depends=('python-numpy' 'python-lxml' 'python-pillow')
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
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build
#   cd ${srcdir}/${_pyname}-${_pkgver}/docs/build
#   cd ${srcdir}/${_pyname}-${pkgver/.p/p}/docs/build
#   cd ${srcdir}/${_pyname}-${_commit}/docs/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
