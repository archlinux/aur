# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-pytest-golden
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.2.2
pkgrel=1
pkgdesc="Plugin for pytest that offloads expected outputs to data files"
arch=('any')
url="https://github.com/oprypin/pytest-golden"
license=('MIT')
makedepends=('python-poetry'
#            'python-platformdirs'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-atomicwrites'
              'python-ruamel-yaml')
source=("https://github.com/oprypin/pytest-golden/archive/refs/tags/v${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f97ec3a4ee556e9439c366f913607e2a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv --color=yes
}

package_python-pytest-golden() {
    depends=('python-pytest>=6.1.2'
             'python-ruamel-yaml>=0.16.12'
             'python-atomicwrites>=1.4.0'
             'python-testfixtures>=6.15.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-pytest-golden-doc() {
#    pkgdesc="Documentation for Python Parfive"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
