# Maintainer: Carl George < arch at cgtx dot us >

_name="supernova"
_cmd="${_name}"

pkgname=("supernova" "supernova2")
pkgver="1.0.7"
pkgrel="8"
pkgdesc="Use novaclient with multiple OpenStack nova environments the easy way"
arch=("any")
url="https://github.com/major/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("${url}/archive/v${pkgver}.tar.gz"
        "nova2-executable.patch"
        "completion-fix.patch")
sha256sums=('e0336590e8b4a73404acbfd7379285c631daf628baaba64c9f42d839982d9949'
            '688de41b2ab9f050b210b30ab24b6bf86bb40cb387eb8ef6a6816a79edb7b195'
            'dd7a1222aba71da8a0d6a8290a4e4b9f9b37bcdf44dc71e58f16fe6dc9320b36')

prepare() {
    patch -d "${srcdir}/${_name}-${pkgver}" -p1 < completion-fix.patch
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
