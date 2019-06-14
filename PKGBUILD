# Maintainer: Astro Benzene <universebenzene at sina dot com>
#pkgbase=python-astroplan
pkgname=('python-astroplan')
#'python-astroplan-doc')
pkgver=0.4
pkgrel=5
pkgdesc="A python package to help astronomers plan observations"
arch=('i686' 'x86_64')
url="https://astroplan.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('cython'
             'python-astropy>=1.3'
             'python-pytz'
             'python-astropy-helpers')
#            'python-sphinx'
#            'python-matplotlib'
#            'python-astroquery')
#checkdepends=('python-matplotlib' 'python-pytest-mpl')
source=("https://files.pythonhosted.org/packages/source/a/astroplan/astroplan-${pkgver}.tar.gz"
        'correct_ephem_name.patch'
        'disable_failing_assertion.patch'
        'fix_doctest_failures.patch')
md5sums=('8ac6dec44aadae0b98775658856a4f01'
         '46f97fe32bba5028f27628bdde8c9da3'
         '7b5c558e1b8f87b614913a0657623720'
         'd74e4eaf50f34476d90476264354fbcc')

prepare() {
    cd ${srcdir}/astroplan-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    patch -Np1 -i "${srcdir}/correct_ephem_name.patch"
    patch -Np1 -i "${srcdir}/disable_failing_assertion.patch"
    patch -Np1 -i "${srcdir}/fix_doctest_failures.patch"
}

build() {
    cd ${srcdir}/astroplan-${pkgver}
    python setup.py build --use-system-libraries --offline

#   msg "Building Docs"
#   python setup.py build_docs
}

#check() {
#    cd ${srcdir}/astroplan-${pkgver}
#
#    python setup.py test
#}

package_python-astroplan() {
    depends=('python>=3.5' 'python-numpy>=1.10' 'python-astropy>=1.3' 'python-pytz')
    optdepends=('python-matplotlib: Plotting support'
                'python-pytest-mpl: Testing the plot function'
                'python-astroquery: Astroquery support')
#               'python-astroplan-doc: Documentation for astroplan')
    cd ${srcdir}/astroplan-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

#package_python-astroplan-doc() {
#    pkgdesc="Documentation for Python astroplan module"
#    cd ${srcdir}/astroplan-${pkgver}/build/sphinx
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
