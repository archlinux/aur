# Maintainer: Carl George < arch at cgtx dot us >

_name="python-cinderclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.4.0"
pkgrel="2"
pkgdesc="OpenStack Block Storage API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.3" "python2-pbr>=1.3")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('744c63112069e107e8efd90a32b19931540f2f749939e816196034e52495cced')

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

package_python-cinderclient() {
    depends=("python-babel>=1.3"
             "python-keystoneclient>=1.6.0"
             "python-pbr>=1.6"
             "python-prettytable>=0.7"
             "python-requests>=2.5.2"
             "python-simplejson>=2.2.0"
             "python-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-cinderclient() {
    depends=("python2-babel>=1.3"
             "python2-keystoneclient>=1.6.0"
             "python2-pbr>=1.6"
             "python2-prettytable>=0.7"
             "python2-requests>=2.5.2"
             "python2-simplejson>=2.2.0"
             "python2-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
