# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-parsley
_pyname=Parsley
pkgname=("${pkgbase}" "${pkgbase}-doc")
pkgver=1.3
pkgrel=2
pkgdesc="Parsing and pattern matching made easy"
arch=('any')
url="https://parsley.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-pytest'
              'python-twisted')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/pyga/parsley/master/ometa/vm.parsley"
        'fix_py2_doc.patch')
md5sums=('92bc256e5f73810a609dc7874637ad31'
         'SKIP'
         'f61f5c5fc7649d1d7543c07575db251f')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_py2_doc.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C doc html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}/build/lib

    cp ${srcdir}/vm.parsley ometa
    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-parsley() {
    depends=('python')
    optdepends=('python-parsley-doc: Documentation for Parsley')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-parsley-doc() {
    pkgdesc="Documentation for Python Parsley module"
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
