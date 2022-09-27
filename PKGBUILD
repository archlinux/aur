# Maintainer: Frederick Zhang <frederick888@tsundere.moe>

pkgname=external-editor-revived
pkgver=0.4.1
pkgrel=1
pkgdesc="External Editor Revived is a Thunderbird MailExtension which allows editing emails in programs such as Vim, Neovim, Emacs and etc."
arch=('x86_64')
url="https://github.com/Frederick888/external-editor-revived"
license=('GPL3')
depends=('thunderbird>=91')
makedepends=('rust' 'zip')
source=(
    "https://github.com/Frederick888/external-editor-revived/archive/refs/tags/v${pkgver}.tar.gz"
    "external_editor_revived.json"
)
md5sums=('80920724f23a32135d60879d0d16ad52'
         '7834086c41c5f319c2796374ac8fa16e')
sha256sums=('150af43cedb06a371ca50e7f447a5dc7a35f5f7ecb2deda14daa4fae134115fb'
            '2f026c1225f83ace07670dac4b7058e646363d8c6ce540abfe6dddaeb2880db7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --locked --release
    cd "${srcdir}/${pkgname}-${pkgver}/extension"
    zip -r -FS "${srcdir}/${pkgname}@tsundere.moe.xpi" *
}

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/lib/thunderbird/extensions"
    install -Dm644 "${pkgname}@tsundere.moe.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${pkgname}@tsundere.moe.xpi"

    install -d "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"
    install -Dm644 "external_editor_revived.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/external_editor_revived.json"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -d "${pkgdir}/usr/share/license/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}
