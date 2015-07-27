# Maintainer: Carl George < arch at cgtx dot us >

_name="supernova"
_cmd="${_name}"

pkgname=("supernova" "supernova2")
pkgver="2.0.3"
pkgrel="1"
pkgdesc="Use novaclient with multiple OpenStack nova environments the easy way"
arch=("any")
url="https://github.com/major/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("${url}/archive/v${pkgver}.tar.gz"
        "nova2-executable.patch")
sha256sums=('07bd11ab4f8660be03751d3cbfb1fa8244e658a7bd9a037995bbfb011928bee6'
            'bd05ce5bc154df2b53fbf4e6fad6c90808ef62df6100427d50e503c4df129e04')

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
