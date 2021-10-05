# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-imexam
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.9.1
pkgrel=1
pkgdesc="A package for functionality like IRAF's imexamine"
arch=('i686' 'x86_64')
url="https://imexam.readthedocs.io"
license=('BSD' 'MIT')
makedepends=('cython' 'python-setuptools-scm' 'xpa' 'python-sphinx-astropy' 'python-ginga' 'python-photutils')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'use_system_xpa.patch'
        'add-tests-subdir-to-copy.patch')
md5sums=('07aae0abbbe4983665fd31fa2aa3b07f'
         '66b06d6b0ef7fee444e1ffb5adb15b15'
         '05b3136e0437fae80962efafe6de3636')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/use_system_xpa.patch"
    patch -Np1 -i "${srcdir}/add-tests-subdir-to-copy.patch"
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
    cp ${_pyname}/*.so build/lib*/${_pyname}

    msg "Building Docs"
#   python setup.py build_sphinx
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-${_pyver}" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package_python-imexam() {
    depends=('python>=3.6' 'python-astropy>=3.0' 'python-matplotlib' 'xpa')
    optdepends=('python-ginga: For Ginga viewer support'
                'ds9: For DS9 viewer support'
                'python-photutils: For photometry features'
                'python-imexam-doc: Documentation for imexam')
#               'python-pytest-astropy: For testing'
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/{LICENSE.rst,LICENSE_MIT.txt}
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-imexam-doc() {
    pkgdesc="Documentation for Python imexam module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/{LICENSE.rst,LICENSE_MIT.txt}
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
