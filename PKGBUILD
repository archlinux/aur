# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx_mdinclude
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.5.2
pkgrel=1
pkgdesc="Markdown extension for Sphinx"
arch=('any')
url="https://sphinx-mdinclude.readthedocs.io"
license=('BSD')
makedepends=('python-flit-core'
             'python-docutils>=0.15'
             'python-mistune>=2.0'
             'python-build'
             'python-installer'
             'python-sphinx')
checkdepends=('python-pytest' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'fix-changlog-highlight.patch'
        'Makefile')
md5sums=('6468d8b5f3020387b3358f0393d930a4'
         'b5bd8e2ac097462791d8f04a480f46e5'
         'a6aa4bc42b138d75f938065a0994c3e1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix-changlog-highlight.patch"
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

    PYTHONPATH="dist/lib" pytest || warning "Tests failed"
}

package_python-sphinx_mdinclude() {
    depends=('python>=3.6' 'python-docutils>=0.15' 'python-mistune>=2.0')
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
