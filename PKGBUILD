# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-abg
_pyname=abg_python
pkgname=("${pkgbase}")
pkgver=1.1.5
pkgrel=1
pkgdesc="common python utilities"
arch=('any')
url="https://github.com/agurvich/abg_python"
license=('MIT')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-scipy'
              'python-h5py'
              'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('812ecfb31ae625c22a52773e8fdee1e0')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i 's/np.AxisError/np.exceptions.AxisError/g' src/abg_python/array_utils.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" -vv -l -ra --color=yes -o console_output_style=count
}

package_python-abg() {
    depends=('python-scipy' 'python-h5py' 'python-pandas' 'python-matplotlib')
    provides=('python-abg-python' 'python-abg_python')
    conflicts=('python-abg-python' 'python-abg_python')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
