# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-codeautolink
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.15.2
pkgrel=1
pkgdesc="Automatic links from code examples to reference documentation"
arch=('any')
url="https://sphinx-codeautolink.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx'
             'python-sphinx_rtd_theme'
             'python-matplotlib'
             'ipython'
             'python-beautifulsoup4')
checkdepends=('python-pytest')    # sphinx, bs4, ipython already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
md5sums=('25f3074ff61d4341481f4d4544cc2b7e'
         'a6aa4bc42b138d75f938065a0994c3e1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -s ${srcdir}/Makefile docs/src
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../../build/lib" make -C docs/src html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-sphinx-codeautolink() {
    depends=('python-sphinx>=3.2.0' 'python-beautifulsoup4>=4.8.1')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 readme*rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-sphinx-codeautolink-doc() {
    pkgdesc="Documentation for sphinx-codeautolink"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/src/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
