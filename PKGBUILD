# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: Frederick Zhang <frederick888@tsundere.moe>

_pkgname=external-editor-revived
pkgname=${_pkgname}-git
pkgver=1.1.0.r2.gcfec308
pkgrel=1
pkgdesc="External Editor Revived is a Thunderbird MailExtension which allows editing emails in programs such as Vim, Neovim, Emacs, etc."
arch=('x86_64')
url="https://github.com/Frederick888/external-editor-revived"
license=('GPL-3.0-or-later')
depends=('thunderbird>=91')
makedepends=('rust' 'zip' 'git')
source=(
    "git+$url"
    "external_editor_revived.json"
)
md5sums=('SKIP'
         '7e14ff6bb5cad780110f056e5c0d7d34')
sha256sums=('SKIP'
            'a4b61c37f16f392f8289002c0e9afc5a8570d7ed902be25c62c7dc0703a20e05')

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --locked --release
    cd "${srcdir}/${_pkgname}/extension"
    zip -r -FS "${srcdir}/${_pkgname}@tsundere.moe.xpi" *
}

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/usr/lib/thunderbird/extensions"
    install -Dm644 "${_pkgname}@tsundere.moe.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_pkgname}@tsundere.moe.xpi"

    install -d "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"
    install -Dm644 "external_editor_revived.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/external_editor_revived.json"

    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
