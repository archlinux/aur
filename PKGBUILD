# Maintainer: Carl George < arch at cgtx dot us >

_name="python-cinderclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.5.0"
pkgrel="1"
pkgdesc="OpenStack Block Storage API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4c4f5f4500afa2d3b6de183a0da573b6a04d18c92d01cc27dd29d0b5ec815d60')

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
    depends=(
        "python-pbr>=1.6"
        "python-prettytable>=0.7"
        "python-keystoneclient>=1.6.0"
        "python-requests>=2.5.2"
        "python-simplejson>=2.2.0"
        "python-babel>=1.3"
        "python-six>=1.9.0"
        "python-oslo-utils>=2.8.0"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-cinderclient() {
    depends=(
        "python2-pbr>=1.6"
        "python2-prettytable>=0.7"
        "python2-keystoneclient>=1.6.0"
        "python2-requests>=2.5.2"
        "python2-simplejson>=2.2.0"
        "python2-babel>=1.3"
        "python2-six>=1.9.0"
        "python2-oslo-utils>=2.8.0"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
