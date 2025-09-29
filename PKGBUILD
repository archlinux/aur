# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinxext-rediraffe
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=0.3.0
pkgrel=2
pkgdesc="Sphinx Extension that redirects non-existent pages to working pages"
arch=('any')
url="https://sphinxext-rediraffe.readthedocs.io"
license=('MIT')
makedepends=('python-flit-core'
             'python-build'
             'python-installer'
             'python-sphinx-furo')
# Too much AUR deps
#checkdepends=('python-pytest-html'
#              'python-pytest-xdist'
#              'python-sphinx'
#              'python-mycdp'
#              'python-filelock'
#              'python-seleniumbase'
#              'python-sbvirtualdisplay'
#              'git'
#    )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-rediraffe_logo_128.png::https://raw.githubusercontent.com/sphinx-doc/sphinxext-rediraffe/refs/tags/v${pkgver}/assets/rediraffe_logo_128.png")
md5sums=('f12d889533b4b8f7f46a1d339ff727ca'
         'ac1de3cced89064202503ba11e528f16')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   sed -i "s/main/${pkgver}/" setup.py
    mkdir assets
    cp {${srcdir}/${pkgver}-,assets/}rediraffe_logo_128.png
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH=".." make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    PYTHONPATH="." pytest -vv -l -ra --color=yes -o console_output_style=count \
#        --deselect=tests/test_ext.py::TestExtHtml::test_redirect_from_deleted_folder \
#        --deselect=tests/test_ext.py::TestExtHtml::test_complex \
#        --deselect=tests/test_ext.py::TestExtHtml::test_jinja \
#        --deselect=tests/test_ext.py::TestExtHtml::test_pass_url_fragments \
#        --deselect=tests/test_ext.py::TestExtHtml::test_pass_url_queries \
#        --deselect=tests/test_ext.py::TestExtHtml::test_pass_url_fragment_and_query \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_simple \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_index_file_foldering \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_no_cycle \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_nested \
#        --deselect=tests/test_ext.py::TestExtHtml::test_nested \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_backslashes \
#        --deselect=tests/test_ext.py::TestExtHtml::test_simple \
#        --deselect=tests/test_ext.py::TestExtHtml::test_no_cycle \
#        --deselect=tests/test_ext.py::TestExtHtml::test_backslashes \
#        --deselect=tests/test_ext.py::TestExtHtml::test_dot_in_filename \
#        --deselect=tests/test_ext.py::TestExtHtml::test_mixed_slashes \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_dot_in_filename \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_mixed_slashes \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_redirect_from_deleted_folder \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_complex \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_jinja \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_pass_url_fragments \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_pass_url_queries \
#        --deselect=tests/test_ext.py::TestExtDirHtml::test_pass_url_fragment_and_query # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-sphinxext-rediraffe() {
    depends=('python-sphinx>=6.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENCE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-sphinxext-rediraffe-doc() {
    pkgdesc="Documentation for Sphinx rediraffe extension"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENCE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
