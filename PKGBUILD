# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ablog
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.10.22
pkgrel=1
pkgdesc=" ABlog for blogging with Sphinx"
arch=('any')
url="https://ablog.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
            'python-sphinx-automodapi'
             'python-nbsphinx'
#            'python-feedgen'
             'python-invoke'
             'python-myst-parser'
             'python-watchdog'
             'pandoc'
             'graphviz')
checkdepends=('python-pytest' 'python-sphinx' 'python-feedgen')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://github.com/sunpy/ablog/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c93bbbbb60a8828507e488bc6e67bbda')

#prepare() {
#    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    pytest
}

package_python-ablog() {
    depends=('python-sphinx' 'python-feedgen' 'python-invoke' 'python-watchdog')    # dateutil pulled by feedgen; docutils by sphinx
    optdepends=('ipython: notebook'
                'python-nbsphinx: notebook'
                'python-myst-parser: markdown'
                'python-ablog-doc: Documentation')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-ablog-doc() {
    pkgdesc="Documentation for ABlog"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
