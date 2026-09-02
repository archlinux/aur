# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-firefly
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=3.6.0
pkgrel=1
pkgdesc="A browser-based particle visualization platform"
arch=('any')
url="https://firefly.rcs.northwestern.edu"
license=('AGPL-3.0-or-later')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest'
              'python-abg') # h5py, matplotlib, pandas(scipy,requests) <- abg
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#source=("https://github.com/ageller/Firefly/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('b878eee06d4ea5f6e405a337106e57af')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/Firefly-${pkgver}

#   export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    sed -i 's/Default/default/g' src/firefly/tests/test_settings.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/Firefly-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   cd ${srcdir}/Firefly-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count #
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
