# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pyspeckit
_pyname=${pkgbase#python-}
_test_commit="c11ed9b3747a7b5bc18a48340ca3c2f207cd8c85"
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0.3
pkgrel=1
pkgdesc="Toolkit for fitting and manipulating spectroscopic data in python"
arch=('any')
url="https://pyspeckit.readthedocs.io"
license=('MIT' 'BSD')
makedepends=('python-setuptools'
             'python-sphinx-astropy'
             'python-astropy')
#            'python-sphinx-astropy')
#checkdepends=('python-pytest'
##             'tk'
#              'python-spectral-cube'
#              'python-scipy'
#              'python-sphinx'
#              'python-matplotlib'
##             'python-six')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://github.com/pyspeckit/pyspeckit-tests/raw/master/HI145947.9+152515_1500+15d.src")
md5sums=('6d6930970e5555f8a5499d78571ec734')

get_pyinfo() {
     [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
             python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e "/^version =/c version = '${pkgver}'" -e "/^release =/c release = '${pkgver}'" docs/conf.py
    sed -i "/cp -R _build/d" docs/Makefile
    sed -i -e 's|getargspec|getfullargspec|g' -e 's|formatargspec|signature|g' docs/sphinxext/docscrape.py
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/{${_pyname}/tests/*.fits,}
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/{${_pyname}/tests/*.txt,}
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/{${_pyname}/tests/wav2rgb.py,}
#   ln -rs ${srcdir}/HI145947*src .
#   sed -e "/import\ idlsave/c from scipy.io import readsav as idlsave" \
#       -e "s|\.read||g" -i ${_pyname}/spectrum/readers/alfalfa.py
#   sed -i "s/\.value//g" examples/agn_example.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    PYTHONPATH="build/lib" pytest -vv -l -ra --color=yes -o console_output_style=count \
#        --ignore=examples/cube_from_scratch_example.py \
#        --ignore=examples/gbt_sdfits_example.py \
#        --ignore=examples/h2co_mm_example.py \
#        --ignore=examples/sn_example.py \
#        --ignore=pyspeckit/tests/alfalfa_example.py \
#        --ignore=pyspeckit/tests/jane_example.py \
#        --ignore=pyspeckit/tests/simple_fit_example.py
#        #|| warning "Tests failed" -vv -l -ra --color=yes -o console_output_style=count
#
#}

package_python-pyspeckit() {
    depends=('python-astropy' 'python-casa-formats-io' 'python-dask' 'python-joblib' 'python-radio_beam>=0.3.3' 'python-six')
    optdepends=('hdf5'
                'python-atpy'
                'python-scipy'
                'python-spectral-cube'
                'python-lmfit'
                'python-pyspeckit-doc: Documentation for PySpecKit')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README*
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm -r ${pkgdir}/$(get_pyinfo site)/examples
}

package_python-pyspeckit-doc() {
    pkgdesc="Documentation for Python PySpecKit module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
