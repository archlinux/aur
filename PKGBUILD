# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="coinkiller"
_pkgname="CoinKiller"
__pkgname="${pkgname}-git"
pkgver=v0.14.r1.g6d8abe4
pkgrel=1
arch=('x86_64')
pkgdesc="NSMB2 level editor!"
url="https://github.com/Arisotura/CoinKiller"
license=('GPL3')
makedepends=('gendesk' 'git')
depends=('qt5-base')
conflicts=('coinkiller-bin' 'coinkiller')
source=("$_pkgname::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # generate .desktop
    cd "${srcdir}/${_pkgname}"
    gendesk --pkgname "Coin Killer" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "Coin Killer.desktop" "${pkgname}.desktop"

}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p build && cd build && qmake .. && make && mkdir -p ../dist && cd ../dist && mv ../coinkiller_data . && mv ../build/CoinKiller .
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/${_pkgname}/dist"
    cp -Rr "${srcdir}/${_pkgname}/dist/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${_pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/${_pkgname}/ck_icon.ico" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
