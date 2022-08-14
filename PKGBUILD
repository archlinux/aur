# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=protonmail-bridge
pkgver=2.2.2
pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://protonmail.com/bridge"
license=('GPL3')
makedepends=('go' 'gcc' 'git')
depends=('hicolor-icon-theme' 'libsecret' 'ttf-dejavu')
optdepends=(
    'org.freedesktop.secrets: Applications that support Freedesktop secrets api'
    'gnome-keyring: gnome-keyring support'
    'pass: pass support'
)
conflicts=('protonmail-bridge-bin')
options=('!emptydirs' '!strip')

# Source to compile to a specific tag
source=("git+https://github.com/ProtonMail/proton-bridge.git#tag=v${pkgver}"
        "protonmail-bridge.desktop")

# Source to compile to a specific commit
#source=("git+https://github.com/ProtonMail/proton-bridge.git#commit=a219ecf3cbe4fa31517136131fc585e93b86c3dd"
#        "protonmail-bridge.desktop")

sha256sums=('SKIP'
            '226bc140ec5c34cfdff42b33058d045446a4006518d2660db932c7f51632b48a')

prepare() {
    cd ${srcdir}/proton-bridge/
    sed -i s/1.8.0+git/1.8.1+git/ Makefile
    export PATH=$PATH:$(go env GOPATH)/bin/  
    make clean
}

build(){
    export PATH=$PATH:$(go env GOPATH)/bin/
    cd ${srcdir}/proton-bridge/
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
