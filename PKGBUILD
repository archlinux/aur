# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgsuffix=bin
_pkgauthor=abenz1267
_pkgname=elephant
_pkgproviders=(1password aptpackages archlinuxpkgs bitwarden bluetooth bookmarks calc clipboard desktopapplications dnfpackages files menus niriactions nirisessions playerctl protonpass providerlist runner snippets symbols todo unicode websearch windows wireplumber)

pkgbase=${_pkgname}-${_pkgsuffix}
pkgname=(${_pkgname}-all-${_pkgsuffix} ${_pkgname}-${_pkgsuffix} $(for provider in ${_pkgproviders[@]}; do echo ${_pkgname}-${provider}-${_pkgsuffix} ; done))

_packages=(${pkgname[@]})

pkgver=2.22.0
pkgrel=1
_pkgvername=v${pkgver}

pkgdesc="general purpose datasource and executor"

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

depends=("glibc")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}.tar.gz"
               $(for provider in ${_pkgproviders[@]}; do echo "${provider}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${provider}-linux-${_barch[0]}.tar.gz" ; done))
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'aa19a7e2d1c07bf1852b65fd38ca24a6b04bba0dacfd9f6cb02ada0ee0b61389')
sha256sums_x86_64=('4370562d65ae23eb3398e0b80ad429e7049197e17647e8c7526c709b89df8340'
                   '51953a93acd556fe30bdf90d2b8ba81a1e85b0fab0217267a93dd6858b9a6b68'
                   '2d28a95c53a36d323c9dfdb241261602228a250d34b6448f6ec61533af9e7550'
                   '6df6195450576d79e0bc2b398bb73857a282d8f7e9878e2a89288845964ee1dd'
                   'cc80fdd3fab616082a6193934fb88cb25c6090d8edf7c4fc4e276b40a2f16407'
                   'c544fc88cf0543cee60d682ce71d5323e43931e7057ed3983b27b3be3a970cef'
                   '49041b19175048c97338be68e1560751ea2ead783a949cba3886f651907bc789'
                   '960dc4319f407aac242fbd54cf1171d13aa31901cd071b7a05ac53079d5bde85'
                   '9af4030af240339b8027143d50f178350c2734c0167062e1ed8aeaf051f3e722'
                   'c5e527d2538b60b51297d9fe3cb0ce0867db89dce264464be278a4896658eb54'
                   '30269e84e7ed0d9876c63e188bb89cfa85c09e5907dddf8b309e3e82674f7cc9'
                   'cb25ec2349697ea2280cfc3ad39c106473a57929a5967a68466162c42f66a3a9'
                   'b93795af000ca2269b77b43d1035292087b39fe45c12728c4b299efe6140e9a6'
                   '8403184838275c1daee02c32e6950c6378c28edfbf7f404c4b9edc59991479f8'
                   'e932874f13238e31e6b20d0a85877857a8ff56f76b637cd12e2f5090eff9bc86'
                   '7db5f9360647102136f3e1cdc9e3a77f30b4c34600cce297c6282f27defdfd4d'
                   '6e9a783d27f7918339ed28137303338769d9f8580127758266b5dfea3e8d4a78'
                   '82f0de50e4e0e343cee1333e67b1f4ac372f44b94bc24390cd7ace5cce97f500'
                   '2d46ee6310b31265b8eca767b049f5d481396c10aa9e6090106ad5a45062929a'
                   'b506653cc119dd8a6e1be9361bbf249f56827593b5c4b9effe8d4d878eb57c11'
                   'de2a636e625a02d30986cd46ef3fa38dc09959d53d25ad39e8fe4d25610fd956'
                   '7b1ede83cfd07396bd62cf014d4e223bd1bcef30f97a8034b01c2a2546900761'
                   '0ef57abe964f3e4767d303f88c2dfa5ec1a6a945eaa223ceb109630d08247243'
                   '4f6102f44b04e04cb83a88aa711dc0c90bec9ce44d912371fe23a9de7e42fbeb'
                   '852a9bb3dc821ae939fa4c2968a73ce8f6535556229d6b61d7fcb5377e0890a7'
                   '3a5df7b8f90da310999d6b3557e806e1d8eef21f780a807de025b0f2726cd118')

case $CARCH in
    ${arch[0]})
        _CARCH=${_barch[0]}
        ;;
esac


package_elephant-all-bin() {
    pkgdesc="elephant + all official elephant providers"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends=("${_packages[@]:1}")
}

package_elephant-bin() {
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")
    depends+=()
    optdepends+=("${_packages[@]:2}")

    cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}-linux-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-1password-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "jq" "sqlite")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-aptpackages-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "apt")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-archlinuxpkgs-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-bitwarden-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "rbw")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-bluetooth-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-bookmarks-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "jq" "sqlite")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-calc-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "libqalculate")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-clipboard-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "wl-clipboard" "imagemagick")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-desktopapplications-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-dnfpackages-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "dnf5")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/bin/" && ln -sf "/usr/bin/dnf5" "${pkgdir}/usr/bin/dnf"
}

package_elephant-files-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "fd")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-menus-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-niriactions-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "niri")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-nirisessions-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "niri")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-playerctl-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "playerctl")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-protonpass-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "proton-pass-cli")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-providerlist-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-runner-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-snippets-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "wtype")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-symbols-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-todo-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-unicode-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-websearch-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-windows-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "fd")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-wireplumber-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "wireplumber")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
