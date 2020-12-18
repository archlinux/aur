# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=protonmail-import-export-app
pkgver=1.2.2
pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://protonmail.com/import-export"
license=('GPL3')
makedepends=('go' 'gcc' 'git')
depends=('hicolor-icon-theme' 'libsecret' 'qt5-multimedia' 'ttf-dejavu')
optdepends=(
    'gnome-keyring: supported password manager (password manager is required)'
    'pass: supported password manager (password manager is required)'
)
conflicts=('protonmail-import-export-app-bin')
options=('!emptydirs' '!strip')
source=("git://github.com/ProtonMail/proton-bridge.git"
        "protonmail-import-export-app.desktop")
sha256sums=('SKIP'
            '5364e91cce218cae19921855b7ff6f2f2b4747ec85537fcbaa237339effafedf')

prepare() {
    cd ${srcdir}/proton-bridge/
    export PATH=$PATH:$(go env GOPATH)/bin/
    git checkout "ie-${pkgver}"
#    make clean
    make build-ie
}

package() {
    mkdir -p "${pkgdir}"/opt
    mkdir -p "${pkgdir}"/usr/bin
    cp -r "${srcdir}"/proton-bridge/cmd/Import-Export/deploy/linux/ "${pkgdir}"/opt/protonmail-import-export-app
    install -D -m644 "${pkgdir}"/opt/protonmail-import-export-app/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    install -D -m644 "${pkgdir}"/opt/protonmail-import-export-app/logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/"${pkgname}".svg
    install -D -m644 "${srcdir}"/protonmail-import-export-app.desktop -t "${pkgdir}"/usr/share/applications/
    ln -s "/opt/protonmail-import-export-app/proton-bridge" "$pkgdir/usr/bin/protonmail-import-export-app"
}
