# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pytest-xvfb
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
pkgver=3.1.1
pkgrel=1
pkgdesc="Pytest plugin to run Xvfb for tests"
arch=('any')
url="https://github.com/The-Compiler/pytest-xvfb"
license=('MIT')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-pyvirtualdisplay'
              'python-pyqt5-webengine'
              'xorg-server-xvfb'
              'xorg-server-xephyr'
              'tigervnc'
              'tk')   # typing_extensions already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('67449595dfccedbea3f036facf50ba9d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="${PWD}/build/lib" PYTEST_PLUGINS=pytest_xvfb pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package() {
    depends=('python>=3.9' 'python-pytest>=2.8.1' 'python-pyvirtualdisplay>=1.3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
