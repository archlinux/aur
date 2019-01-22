# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-atpy
_pyname=ATpy
pkgname=('python2-atpy' 'python-atpy-doc')
pkgver=0.9.7
pkgrel=1
pkgdesc="A new XNAT client that exposes XNAT objects/functions as python objects/functions."
arch=('i686' 'x86_64')
url="https://atpy.readthedocs.io/"
license=('MIT')
makedepends=('python2-setuptools' 'python2-astropy' 'python2-sphinx')
#checkdepends=('python2-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'correct_doc_label.patch')
md5sums=('2306195fcefff7c1e4d36ae92a894ff2'
         'fdf28ae7bde877e055b4b18d75574c9c')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/correct_doc_label.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python2 setup.py build

    msg "Building Docs"
    python2 setup.py build_sphinx
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    python2 setup.py test
#}

package_python2-atpy() {
    depends=('python2>=2.6' 'python2-numpy>=1.5' 'python2-astropy>=0.2')
    optdepends=('python-atpy-doc: Documentation for Python-ATpy'
                'python2-pytest: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-atpy-doc() {
    pkgdesc="Documentation for Python ATpy module"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
