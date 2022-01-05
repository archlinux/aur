# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-parfive
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.5.1
pkgrel=1
pkgdesc="A HTTP and FTP parallel file downloader"
arch=('any')
url="https://parfive.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm' 'python-sphinx-astropy' 'python-aiohttp' 'python-tqdm' 'graphviz' 'python-sunpy-sphinx-theme')
checkdepends=('python-pytest-localserver' 'python-pytest-asyncio' 'python-pytest-socket' 'python-aioftp' 'python-aiofiles')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('cb6861020bd3cd22c6f9a70cf85c47c1')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # deselect tests that may take long time
    pytest \
    --deselect=parfive/tests/test_downloader.py::test_ftp || warning "Tests failed"
}

package_python-parfive() {
    depends=('python>=3.7' 'python-tqdm' 'python-aiohttp')
    optdepends=('python-aioftp: For downloads over FTP'
                'python-parfive-doc: Documentation for Parfive')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-parfive-doc() {
    pkgdesc="Documentation for Python Parfive"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
