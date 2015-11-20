# Maintainer: Carl George < arch at cgtx dot us >

_name="python-glanceclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.2.0"
pkgrel="1"
pkgdesc="OpenStack Image API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://github.com/openstack/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('4caa4f7a1402af65ce9988fb1604f212481be5d8d46a0eac2fe3aafccd07ea15')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse/d' requirements.txt
}

package_python-glanceclient() {
    depends=(
        "python-pbr>=1.6"
        "python-babel>=1.3"
        "python-prettytable>=0.7"
        "python-keystoneclient>=1.6.0"
        "python-requests>=2.5.2"
        "python-warlock>=1.0.1"
        "python-six>=1.9.0"
        "python-oslo-utils>=2.4.0"
        "python-oslo-i18n>=1.5.0"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-glanceclient() {
    depends=(
        "python2-pbr>=1.6"
        "python2-babel>=1.3"
        "python2-prettytable>=0.7"
        "python2-keystoneclient>=1.6.0"
        "python2-requests>=2.5.2"
        "python2-warlock>=1.0.1"
        "python2-six>=1.9.0"
        "python2-oslo-utils>=2.4.0"
        "python2-oslo-i18n>=1.5.0"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
