# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pytest-golden
#_pyname=${pkgbase#python-}
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pyname}-doc")
pkgver=1.0.0
pkgrel=1
pkgdesc="Plugin for pytest that offloads expected outputs to data files"
arch=('any')
url="https://github.com/oprypin/pytest-golden"
license=('MIT')
makedepends=('python-hatchling'
#            'python-platformdirs'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-ruamel-yaml')
#source=("https://github.com/oprypin/pytest-golden/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1c5f124d80b420a2df976d938b593ffc')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-pytest-golden() {
    depends=('python-pytest>=6.1.2'
             'python-ruamel-yaml>=0.16.12'
#            'python-atomicwrites>=1.4.0'
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
