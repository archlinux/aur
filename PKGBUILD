# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx_mdinclude
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.5.3
pkgrel=1
pkgdesc="Markdown extension for Sphinx"
arch=('any')
url="https://sphinx-mdinclude.readthedocs.io"
license=('BSD')
makedepends=('python-flit-core'
             'python-docutils>=0.16'
             'python-mistune>=2.0'
             'python-pygments>=2.8'
             'python-build'
             'python-installer'
             'python-sphinx')
checkdepends=('python-pytest' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'Makefile')
md5sums=('4657ffb422d58014f4d7cc96e983164b'
         'a6aa4bc42b138d75f938065a0994c3e1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -s ${srcdir}/Makefile docs
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../dist/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
}

package_python-sphinx_mdinclude() {
    depends=('python>=3.6' 'python-docutils>=0.16' 'python-mistune>=2.0' 'python-pygments>=2.8')
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
