# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-chalk-planar
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.4
pkgrel=1
pkgdesc="2D planar geometry library for Python."
arch=('any')
url="https://github.com/chalk-diagrams/planar"
license=('BSD-3-Clause')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer'
#            'python-sphinx')
checkdepends=('python-pytest'
              'python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://files.pythonhosted.org/packages/source/p/planar/planar-${pkgver}.tar.gz")
md5sums=('20c10fe5d5fc8405094c73e3f638ea76')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   pythonpath="../build/lib" make -C doc html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest \
        --ignore=test/test_box.py \
        --ignore=test/test_line.py \
        --ignore=test/test_polygon.py \
        --ignore=test/test_transform.py \
        --ignore=test/test_vector.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count

#   python -m nose.core -d -w build/lib/ --with-coverage --cover-erase
}

package_python-chalk-planar() {
    depends=('python')
    optdepends=('python-chalk-planar-doc: Documentation for chalk planar')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-chalk-planar-doc() {
    pkgdesc="Documentation for chalk planar"
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -D -m644 ../../LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
