# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgsuffix=bin
_pkgauthor=abenz1267
_pkgname=elephant
_pkgproviders=(websearch unicode todo symbols runner providerlist menus files desktopapplications clipboard calc archlinuxpkgs bluetooth windows snippets niriactions nirisessions bookmarks 1password dnfpackages bitwarden)

pkgbase=${_pkgname}-${_pkgsuffix}
pkgname=(${_pkgname}-all-${_pkgsuffix} ${_pkgname}-${_pkgsuffix} $(for provider in ${_pkgproviders[@]}; do echo ${_pkgname}-${provider}-${_pkgsuffix} ; done))

_packages=(${pkgname[@]})

pkgver=2.19.0
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
sha256sums_x86_64=('b4c09063c3a32e026e0896d58a8ed0460f746bcbc149a3efc0fea4f9cff988ff'
                   '786a1173dce3e9d5db359298976d69820544d7cd74f05a2a2a91d0e5cf106e12'
                   'e75c21f3e7487c1e8e5c928aca997216bbb26987ba55f454babae320422225ed'
                   '2a1361022e823efa49687dc65172cd05dab0648b26b527f07498fa7ebd3786a0'
                   '9884aa1cb756b8d7080a6a0366a84d2168c3113f2c31c828a4e2148cbae98a65'
                   '6d40a032ba489558d166a2ad170910b1e5c08c0596014068a3c2861fd2633fa1'
                   '1ffab0ceb0f42a5e7923e3d7adbd073d86a2345785466351c9270f100d71033d'
                   'f48c83f1b3ba60e9b703f85627242b69a68f09bda90858276c07246df255a990'
                   'a7fe895529380a17f0247b9f869c156eabf18ee04f259ada64efb13a17f4da65'
                   '85975fb5c160a258a870429a035db636a6eaa35b196265104318ce484495255b'
                   '58a660d121acb875f93771bba02550ad5254be7d3ae273de7631ba0376086eac'
                   'a6a548265a5d22aa842a834f7cb88106095a253114451a1593320042df2adff7'
                   '16e00c5f8c1809eba2a49dfd8e22dff5d29be183115bcd007310986927768c56'
                   'ff996d5e6763b6650b206dcfe9c885636a517b8414bf8227b912ce12df49e57d'
                   'a7f0027f2129e3fd80da261eb0da9ab5075d0569fef77fe6d90619c44e0cdb79'
                   'bd718621dbe69f91819baa4f69ca97174d957d24a204eb5b89e4c69af2baaef3'
                   '2cf9e68c6c442ee3c8e492ec4cf66ae29496a5751c65b14156853e853a1ae5bd'
                   'cc13d65c6501c933b7a42e2910000178bc833f116b1f118fe17245df314a8be2'
                   'fe1ae3a43ff3f4eb84a977c48ecab3d07d00ccd1638356dfbebb369108584972'
                   '76529f6a1b65224fd18f55b8fde25dfdbbf2d518e555dbe93ff9f1fe8fe8044b'
                   'b87aefda6dc4418e0d8dfcb37b973da7025d8b68cf38b225cce8a34aa5a16813'
                   '1d7823a709377a20358b3597de8a636546f139e1ddf5a756b396b93cd5e3cfbf')

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

