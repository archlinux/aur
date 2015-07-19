# Maintainer: Carl George < arch at cgtx dot us >

_name="supernova"
_cmd="${_name}"

pkgname=("supernova" "supernova2")
pkgver="2.0.0"
pkgrel="1"
pkgdesc="Use novaclient with multiple OpenStack nova environments the easy way"
arch=("any")
url="https://github.com/major/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("${url}/archive/v${pkgver}.tar.gz"
        "nova2-executable.patch")
sha256sums=('43b27ee9ed2ca7b0b5860bf52422750e215b60cb71eca106a57b4f900faef24e'
            'cd2d47ce9d9b949844c5e58ed7a1b32cb2367fd7c4429ec0d971fd24bd544704')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}"{,-python2}
    patch -d "${srcdir}/${_name}-${pkgver}-python2" -p1 < nova2-executable.patch
}

package_supernova() {
    conflicts=("python-supernova" "python-supernova-git" "supernova-git")
    depends=("python-click"
             "python-configobj"
             "python-keyring>=0.9.2"
             "python-novaclient"
             "python-six")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "contrib/${_cmd}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_supernova2() {
    conflicts=("python2-supernova" "python2-supernova-git" "supernova2-git")
    depends=("python2-click"
             "python2-configobj"
             "python2-keyring>=0.9.2"
             "python2-novaclient"
             "python2-six")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    mv "${pkgdir}/usr/bin/${_cmd}-keyring" "${pkgdir}/usr/bin/${_cmd}2-keyring"
    install -Dm644 "contrib/${_cmd}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
