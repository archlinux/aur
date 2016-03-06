# Maintainer: Carl George < arch at cgtx dot us >

_name="python-swiftclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="3.0.0"
pkgrel="1"
pkgdesc="OpenStack Object Storage API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr" "python2-pbr")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('824b8f204c5a7764de51795256e4175fdcd655ae4df85b8ae6e6ea9ec0b41f68')

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
        "python2-futures>=2.1.3"
        "python-requests>=1.1"
        "python-six>=1.5.2"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    mv "${pkgdir}/usr/share/man/man1/${_cmd}.1" "${pkgdir}/usr/share/man/man1/${_cmd}2.1"
}
