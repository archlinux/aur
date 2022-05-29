# Maintainer: BadBoy <luckmelove2@gmail.com>

_pkgname='bing-wallpaper'
pkgbase='bing-wallpaper-download'
pkgname=(
        'bing-wallpaper-download'
        'bing-wallpaper-download-cn'
)
pkgver=0.1
pkgrel=1
pkgdesc="Automatic daily download of Bing wallpapers"
arch=(
    'x86_64'
    'i686'
    'arm'
    'armv6h'
    'armv7h'
    'aarch64'
)
license=('GPL3')
url='https://github.com/wo2ni/bing-wallpaper-download'
depends=('glibc' 'feh')
makedepends=('go')
install="${pkgname}.install"

source=(
        "git+${url}.git"
        "${pkgbase}.install"
)

sha256sums=('SKIP'
            '53ccca643c0554fcf610437fbf0c6c18adee3f5c9bc1e111fe05a8a9b720d33d')

build() {
    cd "${srcdir}/${pkgbase}"
    make -j $(nproc)
    mv -v "${_pkgname}" "${srcdir}/${pkgbase}/${_pkgname}-us" 

    sed -i 's/return fmt.Sprintf("%s%s", bingURL, link), nil/return fmt.Sprintf("%s", link), nil/g' "${srcdir}/${pkgname}/${_pkgname}.go"
    make -j $(nproc)
}

package_bing-wallpaper-download() {
    msg "Install ${pkgname[0]}"
    install -dm755 "${pkgdir}/usr/local/bin/"
    install -Dm755 "${srcdir}/${pkgname}/${_pkgname}-us" "${pkgdir}/usr/local/bin/${_pkgname}"

    msg "Install ${pkgname[0]} systemd timer and service"
    install -dm755 "${pkgdir}/etc/systemd/system/"
    for i in "${srcdir}/${pkgbase}"/*{timer,service}; do
        install -Dm644 "${i}" "${pkgdir}/etc/systemd/system/"
    done
}

package_bing-wallpaper-download-cn() {
    msg "Install ${pkgname[1]}"
    install -dm755 "${pkgdir}/usr/local/bin/"
    install -Dm755 "${srcdir}/${pkgbase}/${_pkgname}" "${pkgdir}/usr/local/bin"

    msg "Install ${pkgname[1]} systemd timer and service"
    install -dm755 "${pkgdir}/etc/systemd/system/"
    for i in "${srcdir}/${pkgbase}"/*{timer,service}; do
        install -Dm644 "${i}" "${pkgdir}/etc/systemd/system/"
    done
}
