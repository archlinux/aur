# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Dominik Stańczak <stanczakdominik at gmail dot com>
# Maintainer: xia0er <xia0er at gmail dot com>

pkgbase=python-pymc3
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=3.11.6
pkgrel=1
pkgdesc="Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI."
arch=('any')
url="https://www.pymc.io/projects/docs/en/v3.11.5"
license=('Apache-2.0')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
#checkdepends=('python-pytest'
#              'python-pytest-xdist'
#              'python-numpy'
#              'python-semver'
#              'python-theano-pymc'
#              'python-dill'
#              'python-deprecat'
#              'python-cachetools'
#              'python-pandas'
#              'python-arviz'
#              'python-typing_extensions'
#              'python-fastprogress'
#              'python-graphviz'
#              )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-deprecated-np.distutils.patch')
sha256sums=('9e930a1cfd2ee558892b4d92af043696c65a622b64098332687fd75c78f10bce'
            '930408da06bb1bbd83b3479091d5ae2f5cf7376c26e0308451684955aaa9e203')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   patch -Np1 -i "${srcdir}/fix_doc_warning.patch"
    patch -Np1 -i "${srcdir}/fix-deprecated-np.distutils.patch"
#   rm pymc3/tests/__init__.py
    sed -i '/Tester/d' pymc3/tests/__init__.py
    sed -i '/pymc3.test/d' pymc3/__init__.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    PYTHONPATH="build/lib" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count xdist -n 4
#}

package_python-pymc3() {
    depends=('python>=3.7'
             'python-arviz>=0.11.0'
             'python-cachetools'
             'python-deprecat'
             'python-dill'
             'python-fastprogress>=0.2.0'
             'python-pandas>=0.24.0'
             'python-patsy>=0.5.1'
             'python-scipy>=1.7.3'
             'python-semver>=2.13.0'
             'python-theano-pymc'
             'python-typing_extensions>=3.7.4')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-pymc3-doc() {
#    pkgdesc="Documentation for PyMC3"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
