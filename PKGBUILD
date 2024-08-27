# Maintainer: <Dima Marhitych> <uzhdimka@gmail.com>
pkgname=netflix-electron31
_pkgname=Netflix
pkgver=1.0.8
_electronversion=31
pkgrel=2
pkgdesc="Unofficial Netflix desktop application using Electron 31"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/netflix-desktop"
license=('GPL')
conflicts=("netflix")
replaces=("netflix")
depends=("electron${_electronversion}")
makedepends=("pnpm")
source=(
    "${pkgname}.tar.bz2"
    "${pkgname}.sh"
)
sha256sums=(
    "adaa179d21129ae5eacac8e175c7839cef041cb87c9e40c26698724e1424d2cf"
    "6770271e8632517b087141c7b264ca6307af9884743619cd97c45bdfa9a97e2c"
)

build() {
    cd "${srcdir}/${pkgname}"

    # Install production dependencies using pnpm
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm install --prod

    # Configure the launcher script with the correct path
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|" \
        -e "s|@runname@|main.js|" \
        -e "s|@cfgdirname@|${pkgname}|" \
        -i "${srcdir}/${pkgname}.sh"
}

package() {
    # Create the application directory and copy files
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}/"* "${pkgdir}/usr/lib/${pkgname}/"

    # Install the renamed launcher script
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/netflix"

    # Install the application icon
    install -Dm644 "${srcdir}/${pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Install the desktop entry
    install -Dm644 "${srcdir}/${pkgname}/netflix.desktop" "${pkgdir}/usr/share/applications/netflix.desktop"
    # Install the application icon
    install -Dm644 "${srcdir}/${pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Install the desktop entry
    install -Dm644 "${srcdir}/${pkgname}/netflix.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

