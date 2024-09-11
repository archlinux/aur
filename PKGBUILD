# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=saturn-git
_pkgname=saturnmusic
pkgver=1.1.1.r4.g310bd4d
pkgrel=1
pkgdesc="Your go-to ToS Compliant Custom Deezer Client - Freezer Reborn"
arch=('x86_64')
url="https://github.com/SaturnMusic/PC"
license=('GPL3')
depends=( flac libnotify libxtst nss )
makedepends=( jq moreutils npm )
optdepends=( libappindicator-gtk3 )
provides=( 'saturnmusic' )
conflicts=( 'saturn-bin')
options=(!debug)

source=( "${_pkgname}::git+https://github.com/SaturnMusic/PC.git"
         "saturn.desktop")

sha256sums=('SKIP'
            '7e3fc3750bea9e62677f055ef00bf3f3fd64ed03dfc73365f273596d43fc65f4')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    npm install
    jq '.build.linux.target = ["dir"]' package.json | sponge package.json
    npm run lbuild
}
package() {
    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "${srcdir}/${_pkgname}/dist/linux-unpacked" "${pkgdir}/opt/Saturn"

    for res in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
	install -m644 "${srcdir}/${_pkgname}/build/iconset/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/saturn.png"
    done

    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "saturn.desktop" "${pkgdir}/usr/share/applications/saturn.desktop"
}
