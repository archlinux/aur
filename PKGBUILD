# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-radio_beam
pkgname=('python-radio_beam' 'python2-radio_beam' 'python-radio_beam-doc')
pkgver=0.2
pkgrel=1
pkgdesc="A tool for manipulating and utilizing two dimensional gaussian beams within the astropy framework"
arch=('i686' 'x86_64')
url="https://github.com/radio-astro-tools/radio-beam"
license=('BSD')
makedepends=('cython' 'cython2' 'python-astropy' 'python-astropy-helpers' 'python2-astropy-helpers' 'python-sphinx' 'python-matplotlib')
#checkdepends=('python-pytest-astropy' 'python2-pytest' 'python2-astropy')
source=("https://files.pythonhosted.org/packages/source/r/radio_beam/radio_beam-${pkgver}.tar.gz")
md5sums=('8b8f9bf2e476f4c13c529be4fa626e89')

prepare() {
    cd ${srcdir}/radio_beam-${pkgver}
    sed -i -e '/auto_use/s/True/False/' setup.cfg

    cp -a ${srcdir}/radio_beam-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/radio_beam-${pkgver}-py2
    python2 setup.py build --use-system-libraries --offline

    msg "Building Python3"
    cd ${srcdir}/radio_beam-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check(){
#    cd $srcdir/radio_beam-${pkgver}
#    python setup.py test
#
#    cd $srcdir/radio_beam-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-radio_beam() {
    depends=('python2' 'python2-astropy')
    optdepends=('python2-pytest: For testing'
                'python-radio_beam-doc: Documentation for Radio Beam')
    cd ${srcdir}/radio_beam-${pkgver}-py2

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-radio_beam() {
    depends=('python' 'python-astropy')
    optdepends=('python-pytest-astropy: For testing'
                'python-radio_beam-doc: Documentation for Radio Beam')
    cd ${srcdir}/radio_beam-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-radio_beam-doc() {
    pkgdesc="Documentation for Python Radio Beam module"
    cd ${srcdir}/radio_beam-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
