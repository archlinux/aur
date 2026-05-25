# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname=python-sphinxcontrib-googleanalytics
_pname=${pkgname#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=0.5
pkgrel=1
pkgdesc="Sphinx extension googleanalytics"
arch=("any")
url="https://github.com/sphinx-contrib/googleanalyticss"
license=('BSD-2-Clause')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-nose')
#checkdepends=('python-pytest-import-check'
#              'python-sphinx'
#    )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('a2ac6df9d16b9c124febf6b44e714c1fd9725e692b73ee84ec6b52b377ff5561')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" | sed 's#^/usr/##' || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   rm build/lib/sphinxcontrib/__init__.py
#   PYTHONPATH="build/lib" pytest build/lib --import-check -vv -l -ra --color=yes -o console_output_style=count
    nosetests -v -x || warning "Tests failed"
}

package() {
    depends=('python-sphinx>=0.6')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
