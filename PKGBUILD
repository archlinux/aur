# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pytest-loop
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
#_pyname=${_pname}
pkgname=("python-${_pname}")
pkgver=1.0.13
pkgrel=1
pkgdesc="Pytest plugin for looping test execution."
arch=('any')
url="https://github.com/anogowski/pytest-loop"
license=('MPL-2.0')
makedepends=('python-hatchling'
             'python-versioningit'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("git+https://github.com/anogowski/pytest-loop.git#tag=v${pkgver}")
md5sums=('98365f49606d5068f92350f1d2569a5f')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/${_pyname}

    mkdir -p dist/lib
    bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
    PYTHONPATH="dist/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#   pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-pytest-loop() {
    depends=('python>=3.7' 'python-pytest>=6')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
