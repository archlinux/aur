# Maintainer: Carl George < arch at cgtx dot us >

_name="python-keystoneclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.7.1"
pkgrel="1"
pkgdesc="Client Library for OpenStack Identity"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.3" "python2-pbr>=1.3")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8457fb65cc88ce009bf757643a27ac00fd5805c7f42d56743d1b6dfc26861e79')

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

package_python-keystoneclient() {
    depends=("python-babel>=1.3"
             "python-iso8601>=0.1.9"
             "python-debtcollector>=0.3.0"
             "python-netaddr>=0.7.12"
             "python-oslo-config>=2.3.0"
             "python-oslo-i18n>=1.5.0"
             "python-oslo-serialization>=1.4.0"
             "python-oslo-utils>=2.0.0"
             "python-pbr>=1.6"
             "python-prettytable>=0.7"
             "python-requests>=2.5.2"
             "python-six>=1.9.0"
             "python-stevedore>=1.5.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-keystoneclient() {
    depends=("python2-babel>=1.3"
             "python2-iso8601>=0.1.9"
             "python2-debtcollector>=0.3.0"
             "python2-netaddr>=0.7.12"
             "python2-oslo-config>=2.3.0"
             "python2-oslo-i18n>=1.5.0"
             "python2-oslo-serialization>=1.4.0"
             "python2-oslo-utils>=2.0.0"
             "python2-pbr>=1.6"
             "python2-prettytable>=0.7"
             "python2-requests>=2.5.2"
             "python2-six>=1.9.0"
             "python2-stevedore>=1.5.0")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
