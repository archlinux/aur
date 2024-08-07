# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-rad
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.21.0
pkgrel=1
pkgdesc="Nancy Grace Roman Space Telescope shared attributes for processing and archive"
arch=('any')
url="https://rad.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-asdf'
             'python-matplotlib')
# circular deps
#checkdepends=('python-pytest-doctestplus'
#              'python-pytest-xdist'
#              'python-crds'
#              'python-roman-datamodels'
#)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bde4d2a571c3933dec869a3712232fd3')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/src/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
#}

package_python-rad() {
    depends=('python>=3.10' 'python-asdf-astropy>=0.5.0')
    optdepends=('python-rad-doc: Documentation for RAD')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-rad-doc() {
    pkgdesc="Documentation for Python RAD"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
