# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stregion
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.1.12
pkgrel=1
pkgdesc="Python parser for ds9 region files"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/stregion"
license=('MIT' 'BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'cython'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy')
#            'python-sphinx'
#            'python-matplotlib'
#            'python-pyparsing'
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-pyparsing'
              'python-astropy'
              'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://raw.githubusercontent.com/spacetelescope/stregion/master/LICENSE.txt"
md5sums=('77f9ccce4d5b89724c1389e037c94c37')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#    sed -i -e "s/ 'matplotlib.sphinxext.only_directives',//" doc/conf.py
    sed -i "s/CardList/Header/" tests/test_region.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#    msg "Building Docs"
##   PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" make -C doc html
#    cd ${srcdir}/${_pyname}-${pkgver}/doc
#    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" python make.py
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   ln -rs doc/figures/pspc_skyview.fits .
#   ln -rs doc/figures/test.reg .
    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" pytest \
        --ignore=doc/figures/test_region_drawing.py \
        --ignore=doc/figures/test_region_drawing2.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
}

package_python-stregion() {
    depends=('python-numpy' 'python-pyparsing>=3.0.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE*
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -r ${pkgdir}/$(get_pyinfo site)/{doc,examples,src,tests}
}

#package_python-stregion-doc() {
#    pkgdesc="Documentation for Python stregion module"
#    arch=('any')
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE*
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
