# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=protonmail-bridge
pkgver=1.5.4
pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://protonmail.com/bridge"
license=('GPL3')
makedepends=('go' 'gcc' 'git')
depends=('hicolor-icon-theme' 'libsecret' 'qt5-multimedia' 'ttf-dejavu')
optdepends=(
    'gnome-keyring: supported password manager (password manager is required)'
    'pass: supported password manager (password manager is required)'
)
conflicts=('protonmail-bridge-bin')
options=('!emptydirs' '!strip')
source=("git://github.com/ProtonMail/proton-bridge.git"
        "protonmail-bridge.desktop")
sha256sums=('SKIP'
            '226bc140ec5c34cfdff42b33058d045446a4006518d2660db932c7f51632b48a')

prepare() {
    cd ${srcdir}/proton-bridge/
    export PATH=$PATH:$(go env GOPATH)/bin/
    git checkout "br-${pkgver}"
    # fix versioning in source 
    # sed -i s/1.4.0-git/1.4.5-git/g Makefile
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
    ln -s "/opt/protonmail-bridge/proton-bridge" "$pkgdir/usr/bin/protonmail-bridge"
}
