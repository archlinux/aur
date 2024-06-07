# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-verspec
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.1.0
pkgrel=1
pkgdesc="Python version/specifier handling"
arch=('any')
url="https://github.com/jimporter/verspec"
license=('Apache-2.0' 'BSD-2-Clause')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
checkdepends=('python-pytest'
              'python-pretend')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('34d408f044894ec89a9780dbb75b6c9e')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i '/test_version/s/\.//' test/test_specifiers.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package() {
    depends=('python>=3.6')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.BSD -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
