# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx_mdinclude
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6.2
pkgrel=1
pkgdesc="Markdown extension for Sphinx"
arch=('any')
url="https://sphinx-mdinclude.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-flit-core'
             'python-build'
             'python-installer'
             'python-sphinx'
             'python-mistune>=3.0')
checkdepends=('python-pytest') # mistune sphinx already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
md5sums=('6ee1de048365f0f960f299faa183bb7f'
         'a6aa4bc42b138d75f938065a0994c3e1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -s ${srcdir}/Makefile docs
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../dist/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-sphinx_mdinclude() {
    depends=('python>=3.8' 'python-sphinx>=6' 'python-mistune>=3.0' 'python-pygments>=2.8')
    optdepends=('python-sphinx_mdinclude-doc: Documentation for ndcube')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-sphinx_mdinclude-doc() {
    pkgdesc="Documentation for sphinx mdinclude"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
