# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-dag-cbor
_pyname=${pkgbase#python-}
#_pname=${pkgbase#python-}
#_pyname=${_pname//-/_}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.3
pkgrel=1
pkgdesc="Python implementation of the DAG-CBOR codec"
arch=('any')
url="https://dag-cbor.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm>=6.2'
             'python-build'
             'python-installer')
#            'python-sphinx'
#            'python-sphinx_rtd_theme'
#            'python-multiformats')  # wheel required by new setuptools, typing-validation <- multiformats
checkdepends=('python-pytest'
              'python-multiformats'
#             'python-pytest-xdist'
              'python-cbor2')   # multiformats already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('32a7531eb152018a0dd3941e4e5e2d94')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}/test
    sed -e "/cbor2.decoder/a import cbor2._decoder as _cbor2" \
        -e 's/cbor2.CBORTag/_cbor2.CBORTag/' -i test_02_decode_eq_cbor2_decode.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

    msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-dag-cbor() {
    depends=('python>=3.7'
             'python-typing_extensions>=4.6.0'
             'python-typing-validation>=1.1.0'
             'python-multiformats>=0.3.1')
    optdepends=('python-dag-cbor-doc: Documentation for dag-cbor')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-dag-cbor-doc() {
#    pkgdesc="Documentation for Python dag-cbor"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
