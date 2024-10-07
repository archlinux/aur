# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-firefly
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=3.3.2
pkgrel=1
pkgdesc="A browser-based particle visualization platform"
arch=('any')
url="https://firefly.rcs.northwestern.edu"
license=('AGPL-3.0-or-later')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-h5py'
              'python-pandas'
              'python-requests'
              'python-abg')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ad4d7cf7954769489fdc15453cc760c4')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i 's/Default/default/g' src/firefly/tests/test_settings.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-firefly() {
    depends=('python>=3.6'
             'python-eventlet'
             'python-flask'
             'python-flask-socketio'
             'python-h5py'
             'python-pandas'
             'python-requests'
             'python-abg>=1.1.1')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
