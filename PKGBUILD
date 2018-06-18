# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-gallery
pkgname=('python-sphinx-gallery' 'python2-sphinx-gallery' 'python-sphinx-gallery-doc')
pkgver=0.2.0
pkgrel=1
pkgdesc="Sphinx extension to automatically generate an examples gallery"
arch=('i686' 'x86_64')
url="http://sphinx-gallery.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-sphinx' 'python-pillow' 'python-scipy' 'python-seaborn')
checkdepends=('python-pytest-cov' 'python2-pytest-cov' 'python2-matplotlib' 'python2-sphinx')
source=("https://github.com/sphinx-gallery/sphinx-gallery/archive/v${pkgver}.tar.gz")
md5sums=('e2a05e0822b240c4c60afbabe9cc8a86')

prepare() {
    cd ${srcdir}/sphinx-gallery-${pkgver}

    cp -a ${srcdir}/sphinx-gallery-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/sphinx-gallery-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/sphinx-gallery-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/sphinx-gallery-${pkgver}
    python setup.py test

    cd ${srcdir}/sphinx-gallery-${pkgver}-py2
    python2 setup.py test
}

package_python2-sphinx-gallery() {
    depends=('python2-sphinx' 'python2-matplotlib' 'python2-pillow')
    optdepends=('python2-seaborn'
                'mayavi'
                'python-sphinx-gallery-doc: Documentation of Sphinx-Gallery')
    cd ${srcdir}/sphinx-gallery-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1

    mv ${pkgdir}/usr/bin/copy_sphinxgallery.sh ${pkgdir}/usr/bin/copy_sphinxgallery2.sh
    mv ${pkgdir}/usr/bin/sphx_glr_python_to_jupyter.py ${pkgdir}/usr/bin/sphx_glr_python_to_jupyter2.py
}

package_python-sphinx-gallery() {
    depends=('python-sphinx' 'python-matplotlib' 'python-pillow')
    optdepends=('python-seaborn'
                'mayavi-py3'
                'python-sphinx-gallery-doc: Documentation of Sphinx-Gallery')
    cd ${srcdir}/sphinx-gallery-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sphinx-gallery-doc() {
    pkgdesc="Documentation for Sphinx-Gallery extension"
    cd ${srcdir}/sphinx-gallery-${pkgver}/doc/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
