# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=healpy
pkgname=python-${_pyname}-doc
pkgver=1.16.3
pkgrel=1
pkgdesc="Documentation for Python iminuit module"
arch=('any')
url="http://healpy.readthedocs.io"
license=('GPL')
makedepends=("python-${_pyname}=${pkgver}"
             'python-numpydoc'
#            'python-pillow'
             'python-nbsphinx>=0.8.6'
             'pandoc'
             'wget')
source=("https://github.com/healpy/healpy/archive/${pkgver}.tar.gz"
        'fix_doc_warning.patch')
md5sums=('00a535f8fbd613b36f0a6f499d0da62b'
         '564da1e5f36d3f48543086a233db6ab0')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_doc_warning.patch"
    sed -e "/^extensions/s/nbsphinx\"\]/nbsphinx\",\ \'IPython\.sphinxext\.ipython_console_highlighting\'\]/" \
        -e "/^extension/a nbsphinx_allow_errors = True" -i doc/conf.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/.build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
