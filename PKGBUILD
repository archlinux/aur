# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-asdf
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
pkgver=0.4.0
pkgrel=1
pkgdesc="Sphinx plugin for generating documentation from ASDF schemas"
arch=('any')
url="https://github.com/asdf-format/sphinx-asdf"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-sphinx'
              'python-asdf'
              'python-mistune>=3')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('7f3472b9e70a8a5d41e8b1de39447967fbceae728f7fc897f7379c3dcfa39ecf')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#       build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
#   PYTHONPATH="build/lib" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#   PYTHONPATH="${PWD}" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
    PYTHONPATH="." pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package() {
    depends=('python-asdf'
#            'python-astropy>=5.0.4'
             'python-mistune>=3'
             'python-packaging'
             'python-numpydoc'
#            'python-sphinx-astropy'
             'python-sphinx-automodapi'
#            'python-sphinx_rtd_theme'
             'python-sphinxcontrib-jquery'
             'python-toml')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
