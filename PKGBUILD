# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-collections
_pyname=${pkgbase#python-}
#_pyname=${_pname//-/_}
pkgname=("python-${_pyname}"  "python-${_pyname}-doc")
pkgver=0.3.1
#_commit="37b54c0a78e1772aabe13634ea2e2211749ac865"
pkgrel=1
pkgdesc="Sphinx extension for collecting external data for Sphinx build"
arch=('any')
url="https://sphinx-collections.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-flit-core'
             'python-build'
             'python-installer'
             'python-sphinx'
             'python-gitpython')
checkdepends=('python-pytest')    # sphinx, gitpython already in makedepends
#checkdepends=('python-pytest-xdist')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/useblocks/sphinx-collections/archive/refs/tags/${pkgver}.tar.gz")
#source=("https://github.com/useblocks/sphinx-collections/archive/${_commit}.tar.gz")
md5sums=('cb7e7171c323071edd961eefd17ca069')

#get_pyinfo() {
#    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
#        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}
#
#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   sed -i "s/0.0.2/${pkgver}/" pyproject.toml
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_commit}
    python -m build --wheel --no-isolation

    msg "Building Docs"
#   mkdir -p dist/lib
#   bsdtar -xpf dist/sphinxcontrib_collections-${pkgver}-py3-none-any.whl -C dist/lib
#   PYTHONPATH="../dist/lib" make -C docs html
    PYTHONPATH="${PWD}" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_commit}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
##  python -m venv --system-site-packages test-env
#   python -m venv test-env
#   test-env/bin/python -m pip install installer setuptools sphinx gitpython pytest
#   test-env/bin/python -m installer dist/*.whl
##  source ../test-env/bin/activate
##  source test-env/bin/activate
##  ../test-env/bin/sphinx-build -b html _build/html
#   test-env/bin/python -m pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#   PYTHONPATH="dist/lib" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#   PYTHONPATH="${PWD}" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-sphinx-collections() {
    depends=('python-sphinx>=4.0' 'python-jinja>=3.0' 'python-gitpython>=3.1' 'python-packaging>=20.0')
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}-${_commit}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-sphinx-collections-doc() {
    pkgdesc="Documentation for sphinx-collections"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
