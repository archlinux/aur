# Maintainer: Carl George < arch at cgtx dot us >

_name="python-cinderclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.3.1"
pkgrel="1"
pkgdesc="OpenStack Block Storage API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=0.11" "python2-pbr>=0.11")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('59ae1fbeeda7a12ac8635a7cce9bdc5e8bd080707e2dc12d858857713db1d233')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse/d' requirements.txt
}

package_python-cinderclient() {
    depends=("python-babel>=1.3"
             "python-keystoneclient>=1.6.0"
             "python-pbr>=0.11"
             "python-prettytable>=0.7"
             "python-requests>=2.5.2"
             "python-simplejson>=2.2.0"
             "python-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-cinderclient() {
    depends=("python2-babel>=1.3"
             "python2-keystoneclient>=1.6.0"
             "python2-pbr>=0.11"
             "python2-prettytable>=0.7"
             "python2-requests>=2.5.2"
             "python2-simplejson>=2.2.0"
             "python2-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
