# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=healpy
pkgname=python-${_pyname}-doc
pkgver=1.15.0
pkgrel=1
pkgdesc="Documentation for Python iminuit module"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.io"
license=('GPL')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc' 'python-pillow' 'python-nbsphinx' 'pandoc' 'wget' 'python-jinja<3.0.0')
source=("https://github.com/healpy/healpy/archive/${pkgver}.tar.gz"
        'fix_doc_warning.patch')
md5sums=('b7e683e33e23cc6640d8a1327af3b55f'
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
