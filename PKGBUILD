# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-remotedata
_pyname=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="Pytest plugin used for controlling access to data files hosted online"
arch=('any')
url="https://github.com/astropy/pytest-remotedata"
license=('BSD')
depends=('python-pytest>=4.6' 'python-packaging')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('8e7cff311898c945510b42e424906c00')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="build/lib" pytest --remote-data || warning "Tests failed" # -vv --color=yes
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
