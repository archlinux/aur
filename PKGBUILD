# Maintainer: Carl George < arch at cgtx dot us >

_name="supernova"
_cmd="${_name}"

pkgname=("supernova" "supernova2")
pkgver="1.0.8"
pkgrel="1"
pkgdesc="Use novaclient with multiple OpenStack nova environments the easy way"
arch=("any")
url="https://github.com/major/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("${url}/archive/v${pkgver}.tar.gz"
        "nova2-executable.patch")
sha256sums=('5abc13e44ca1eeeb7626fe133a104fec19ec5663ea3b7077af8874cb70b7baad'
            '688de41b2ab9f050b210b30ab24b6bf86bb40cb387eb8ef6a6816a79edb7b195')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}"{,-python2}
    patch -d "${srcdir}/${_name}-${pkgver}-python2" -p1 < nova2-executable.patch
}

package_supernova() {
    conflicts=("python-supernova" "python-supernova-git" "supernova-git")
    depends=("python-novaclient" "python-keyring")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "contrib/${_cmd}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_supernova2() {
    conflicts=("python2-supernova" "python2-supernova-git" "supernova2-git")
    depends=("python2-novaclient" "python2-keyring")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    mv "${pkgdir}/usr/bin/${_cmd}-keyring" "${pkgdir}/usr/bin/${_cmd}2-keyring"
    install -Dm644 "contrib/${_cmd}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
