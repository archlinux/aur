# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-hips
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.2
pkgrel=2
pkgdesc="Python astronomy package for HiPS"
arch=('i686' 'x86_64')
url="https://hips.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-astropy' 'python-astropy-helpers>=3.1' 'python-sphinx-astropy' 'python-sphinx_rtd_theme' 'python-scikit-image' 'python-astropy-healpix' 'python-tqdm')
#checkdepends=('python-pytest-astropy')
#'python-dask')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Fix-numpy-doctest-incompatibility.patch')
md5sums=('9acf7a722837ba9d61f85d5710415ece'
         'c0c026ad536e73dca0ea0cad151ebf6c')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
    patch -Np1 -i "${srcdir}/Fix-numpy-doctest-incompatibility.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

    msg "Building Docs"
    python setup.py build_docs
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python setup.py test
#}

package_python-hips() {
    depends=('python>=3.6' 'python-astropy>=1.3' 'python-astropy-healpix>=0.2' 'python-scikit-image>=0.12' 'python-pillow>=4.0')
    optdepends=('python-matplotlib>=2.0: Used for plotting in examples.'
                'python-tqdm: Used for showing progress bar either on terminal or in Jupyter notebook.'
                'python-aiohttp: Used for fetching HiPS tiles.'
                'python-hips-doc: Documentation for Python HIPS module'
                'python-pytest-astropy: For testing'
                'python-astropy<3.2: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

package_python-hips-doc() {
    pkgdesc="Documentation for Python HIPS module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
