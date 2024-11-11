# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-aiohttp-retry
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pyname}-doc")
pkgver=2.9.1
pkgrel=1
pkgdesc="Simple retry client for aiohttp"
arch=('any')
url="https://github.com/inyutin/aiohttp_retry"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx'
checkdepends=('python-pytest-aiohttp'
#             'python-pytest-xdist'
              'python-pytest-asyncio')  # aiohttp required by pytst-aiohttp
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-app.py::https://github.com/inyutin/aiohttp_retry/raw/refs/tags/v${pkgver}/tests/app.py")
md5sums=('4876915211e331cccc65f210eb39059d'
         'f740b295393c19c0988e24b2499e1ecc')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs {${srcdir}/${pkgver}-,tests/}app.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="${PWD}" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-aiohttp-retry() {
    depends=('python>=3.7' 'python-aiohttp')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-aiohttp-retry-doc() {
#    pkgdesc="Documentation for Python Parfive"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
