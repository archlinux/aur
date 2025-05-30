# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stsci.image
_pname=${pkgbase#python-}
_pyname=${_pname//./_}
pkgname=("python-${_pname}")
#"python-${_pyname}-doc")
pkgver=2.3.11
pkgrel=1
pkgdesc="Image array manipulation functions"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/stsci.image"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-numpy')  # wheel required by new setuptools
#'python-stsci.sphinxext')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5a4e530006c181a18620026aa6528142')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check

#   msg "Building Docs"
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    for so in $(find build -name '*gnu*so'); do cp $so ${so#*$(get_pyinfo)/}; done
    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-stsci.image() {
    depends=('python-numpy>=1.14' 'python-scipy')
    optdepends=('python-stsci.image-doc: Documentation for STScI Image')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    python -m installer --destdir="${pkgdir}" dist/*.whl
#   rm -r ${pkgdir}/$(get_pyinfo site)/stsci/{__init__.py,__pycache__/*}
#   rm "${pkgdir}/usr/lib/python$(get_pyver .)/site-packages/stsci/__init__.py"
#   rm "${pkgdir}/usr/lib/python$(get_pyver .)/site-packages/stsci/__pycache__"/*
}

#package_python-stsci.image-doc() {
#    pkgdesc="Documentation for Python STScI Image"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
