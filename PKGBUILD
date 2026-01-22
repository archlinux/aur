# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgsuffix=bin
_pkgauthor=abenz1267
_pkgname=elephant
_pkgproviders=(websearch unicode todo symbols runner providerlist menus files desktopapplications clipboard calc archlinuxpkgs bluetooth windows snippets niriactions nirisessions bookmarks 1password dnfpackages bitwarden)

pkgbase=${_pkgname}-${_pkgsuffix}
pkgname=(${_pkgname}-all-${_pkgsuffix} ${_pkgname}-${_pkgsuffix} $(for provider in ${_pkgproviders[@]}; do echo ${_pkgname}-${provider}-${_pkgsuffix} ; done))

_packages=(${pkgname[@]})

pkgver=2.19.1
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
            '77c380f4172541442054e2c23c2c0c1d0184b453ee52a26e352c1460972b65f1')
sha256sums_x86_64=('cee73e19e66041d4853cf5cc4a47dfd9190280c3d02f9030bd9d7eb9e5523c03'
                   '2718982a369e4e9aa47192cdd48a069b8d4fc39cca2154dca0fe7b8add773ce0'
                   '6e17831fad9b31e52f93948594700ac509d420a004d8dc618bde7a876238855a'
                   '35112543f6765b30358fc4ef028f70a16a26f221d4d5eb364857abb4a9888a6b'
                   'a90784b3cc96c9a202f04c0904ecb710c14041b1799b43d7e1229fa04959aa81'
                   '3380d1dde9eaaab9d1fcb110a3e0fa19d2ee44c8613d9d9e7f054725cc80c2fb'
                   '95fa04ee1cd9adb72bf566b6314b1ae453e68141354fc7f760785489de405a44'
                   '2b7a64904d9bd11024f11bf313a70acd07a5bac43d81f1bbfc9fee1ba89bea38'
                   '3f55e3f0af58a0340e4667889ef0f03b4e8a8f207fad34d897e87c162c3c6115'
                   'ddd12e0fcd5226a1f875cacc3310c085323aa15da3c93142e8e31326aef1a9ba'
                   '1503054efc9420dfd3409c6ed1ae20087fdeadf4970bef4f857258988b767106'
                   'e3c316e2703b3d69d9c679f652eb722d108cd45e7b13d1ed50b2a328eb4d4527'
                   'dff6d55f243ba9dee80ed54ed63810898f686b0cea04b8e4c9665a541384f84b'
                   '720054cbb8c83426b534fbdb9dc3b9c931f22b62e18b052c0ed13d4fcf26ab24'
                   '2cb9e8ef823c62e407a4fcbd0dad38c29cbf468de249ffb44b73355b8ebc3b78'
                   'fd133080c67d5a13193779c0ae3cf7b11006cdd4a64376634d03c77edd8fd9b8'
                   '98758be40df2c5ea4aa6eb82f0cb485fcadbaf6146da2ca3d346b944f712e0ba'
                   'fae99858593bc575bd5cc89f5c44cc14b8ef000f270af60c476d8d9ebf435f4a'
                   '4616e75615f896626841fb696497974f289c6d0fe3f9f0f5e9895eef09413d29'
                   'c99a32a34c343cc5d266fa7fd7ea9844fd84fdffb1d5ac76e90e14fba6d68bc0'
                   '45229a0170945d5073a3cc7a9d0c58e62a31c0b5875fa593530e4aec95b4b709'
                   '7eb0e6d197629cfc6e1ca513fe69a6819679d8d8d345d5a4d64339976b6e10ce')

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

package_elephant-websearch-bin() {
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

package_elephant-todo-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

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

package_elephant-runner-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

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

package_elephant-menus-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
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

package_elephant-desktopapplications-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}")

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

package_elephant-calc-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "libqalculate")

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

package_elephant-bluetooth-bin() {
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

package_elephant-snippets-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "wtype")

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

package_elephant-bookmarks-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "jq" "sqlite")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

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

package_elephant-bitwarden-bin() {
    pkgdesc="${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)} provider for ${_pkgname}"

    conflicts=("${pkgname%%-${_pkgsuffix}}")
    provides=("${pkgname%%-${_pkgsuffix}}")
    depends+=("${_pkgname}-${_pkgsuffix}" "rbw")

    cd "${srcdir}/" || exit

    install -Dm755 "${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/${pkgname:${#_pkgname}+1:(${#pkgname}-${#_pkgname}-${#_pkgsuffix}-2)}.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

