# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ablog
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.11.3
pkgrel=1
pkgdesc=" ABlog for blogging with Sphinx"
arch=('any')
url="https://ablog.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-nbsphinx'
             'python-myst-parser'
             'python-feedgen'
             'python-invoke'
             'python-watchdog'
             'pandoc'
             'graphviz')
checkdepends=('python-pytest')
# sphinx feedgen already in makedepends, feedgen depends on lxml
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://github.com/sunpy/ablog/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c598b0098547641a47364212b834c391')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/src/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package_python-ablog() {
    depends=('python-sphinx>=5.0.0' 'python-feedgen>=0.9.0' 'python-invoke>=1.6.0' 'python-watchdog>=2.1.0' 'python-packaging>=19.0')    # dateutil pulled by feedgen; docutils by sphinx
    optdepends=('ipython>=7.30.0: notebook'
                'python-nbsphinx>=0.8.0: notebook'
                'python-myst-parser>=0.17.0: markdown'
                'python-ablog-doc: Documentation')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ablog-doc() {
    pkgdesc="Documentation for ABlog"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
