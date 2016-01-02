# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name="python-novaclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="3.1.0"
pkgrel="1"
pkgdesc="Client library for OpenStack Compute API"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d4104a72f85ca5a76b8d6cddb46f37870314cb140146b6fb287493020610ca60')

prepare() {
    sed -ri '/argparse/d' "${srcdir}/${_name}-${pkgver}"/requirements.txt
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-novaclient() {
    depends=(
        "python-pbr>=1.6"
        "python-keystoneauth1>=2.1.0"
        "python-iso8601>=0.1.9"
        "python-oslo-i18n>=1.5.0"
        "python-oslo-serialization>=1.10.0"
        "python-oslo-utils>=3.2.0"
        "python-prettytable>=0.7"
        "python-requests>=2.8.1"
        "python-simplejson>=2.2.0"
        "python-six>=1.9.0"
        "python-babel>=1.3"
    )

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-novaclient() {
    depends=(
        "python2-pbr>=1.6"
        "python2-keystoneauth1>=2.1.0"
        "python2-iso8601>=0.1.9"
        "python2-oslo-i18n>=1.5.0"
        "python2-oslo-serialization>=1.10.0"
        "python2-oslo-utils>=3.2.0"
        "python2-prettytable>=0.7"
        "python2-requests>=2.8.1"
        "python2-simplejson>=2.2.0"
        "python2-six>=1.9.0"
        "python2-babel>=1.3"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
