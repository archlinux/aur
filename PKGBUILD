# Maintainer: Carl George < arch at cgtx dot us >

_name="python-glanceclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.19.0"
pkgrel="2"
pkgdesc="OpenStack Image API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=0.11" "python2-pbr>=0.11")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('45115023cadfdbc24a10b10ca5d003f8f04fd5642b7c8fb565efa566bac4bf51')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse/d' requirements.txt
}

package_python-glanceclient() {
    depends=("python-babel>=1.3"
             "python-keystoneclient>=1.6.0"
             "python-oslo-i18n>=1.5.0"
             "python-oslo-utils>=1.4.0"
             "python-pbr>=0.11"
             "python-prettytable>=0.7"
             "python-pyopenssl>=0.11"
             "python-requests>=2.5.2"
             "python-six>=1.9.0"
             "python-warlock>=1.0.1")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-glanceclient() {
    depends=("python2-babel>=1.3"
             "python2-keystoneclient>=1.6.0"
             "python2-oslo-i18n>=1.5.0"
             "python2-oslo-utils>=1.4.0"
             "python2-pbr>=0.11"
             "python2-prettytable>=0.7"
             "python2-pyopenssl>=0.11"
             "python2-requests>=2.5.2"
             "python2-six>=1.9.0"
             "python2-warlock>=1.0.1")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
