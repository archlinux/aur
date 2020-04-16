# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=protonmail-bridge
pkgver=1.2.6
pkgrel=2
_pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://www.protonmail.com/bridge"
license=('GPL3')
makedepends=('go' 'gcc')
depends=('hicolor-icon-theme' 'libsecret' 'qt5-multimedia' 'ttf-dejavu')
optdepends=(
    'gnome-keyring: supported password manager (password manager is required)'
    'pass: supported password manager (password manager is required)'
)
conflicts=('protonmail-bridge-bin')
options=('!emptydirs' '!strip')
source=("git://github.com/ProtonMail/proton-bridge.git"
        "protonmail-bridge.desktop"
        "protonmail-bridge")
sha256sums=('SKIP'
            '38638abfe99372a618a3b6e8939f1e94037203e1499cbd7c93fc6b0b47da0a2e'
            '0b95101d33653e337e74e866a13b2a6006304a9a157e74ba36fa49b2b68ec826')

prepare() {
    cd ${srcdir}/proton-bridge/
    export PATH=$PATH:$(go env GOPATH)/bin/
    make clean
    make build
}

package() {
    mkdir -p "${pkgdir}"/opt
    mkdir -p "${pkgdir}"/usr/bin
    cp -r "${srcdir}"/proton-bridge/cmd/Desktop-Bridge/deploy/linux/ "${pkgdir}"/opt/protonmail-bridge
    install -D -m644 "${pkgdir}"/opt/protonmail-bridge/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    install -D -m644 "${pkgdir}"/opt/protonmail-bridge/logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/"${pkgname}".svg
    install -D -m644 "${srcdir}"/protonmail-bridge.desktop -t "${pkgdir}"/usr/share/applications/
    install -D -m755 "${srcdir}"/protonmail-bridge -t "${pkgdir}"/usr/bin/
}
