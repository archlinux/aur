# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ablog
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.11.12
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
#             'python-defusedxml'
# sphinx feedgen already in makedepends, feedgen depends on lxml
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://github.com/sunpy/ablog/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('fd7ddfde7deb5e90eea456f36afc12a6')

#get_pyver() {
#    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}
#
#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    sed -i "/ignore:'imghdr'/a \	ignore:'sphinx.testing.path' is deprecated:sphinx.deprecation.RemovedInSphinx90Warning" setup.cfg
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/src/${_pyname/-/_}*egg-info \
#       build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
}

package_python-ablog() {
    depends=('python-sphinx>=6.2.0' 'python-feedgen>=0.9.0' 'python-invoke>=1.6.0' 'python-watchdog>=2.1.0' 'python-packaging>=19.0')    # dateutil pulled by feedgen; docutils by sphinx
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
