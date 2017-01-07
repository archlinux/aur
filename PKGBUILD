# Maintainer: Carl George < arch at cgtx dot us >

_name="python-swiftclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="3.2.0"
pkgrel="2"
pkgdesc="OpenStack Object Storage API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr" "python2-pbr")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8761697584ab060520d6094e8394242ee3b94c643ed1f3fe1dbc67df585ab3fa')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
    # futures is only needed for python 2
    sed -ri '/futures/d' "${_name}-${pkgver}/requirements.txt"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-swiftclient() {
    depends=(
        "python-requests>=1.1"
        "python-six>=1.5.2"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-swiftclient() {
    depends=(
        "python2-futures>=3.0"
        "python-requests>=1.1"
        "python-six>=1.5.2"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    mv "${pkgdir}/usr/share/man/man1/${_cmd}.1" "${pkgdir}/usr/share/man/man1/${_cmd}2.1"
}
