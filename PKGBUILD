# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=turbotap-bin
_name=turbotap
pkgver=1.6.7
pkgrel=1
pkgdesc='Fast CLI for driving a physical iPhone over Wi-Fi from a terminal or AI agent (prebuilt binary)'
arch=('x86_64')
url='https://github.com/Maxteabag/turbotap'
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('tesseract: local OCR via libtesseract'
            'tesseract-data-eng: English OCR training data')
provides=("${_name}")
conflicts=("${_name}")
# The release binary is already stripped and checksum-pinned; makepkg's strip would rewrite its ELF container.
options=('!strip' '!debug')
source=("${_name}-linux-x86_64::https://github.com/Maxteabag/${_name}/releases/download/v${pkgver}/${_name}-linux-x86_64"
        "${_name}-linux-x86_64.SHA256SUMS::https://github.com/Maxteabag/${_name}/releases/download/v${pkgver}/${_name}-linux-x86_64.SHA256SUMS"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Maxteabag/${_name}/v${pkgver}/LICENSE")
sha256sums=('cc5dadb46585cea74549f2f3c9e77dc8bb1d74261ce15e7a7031589fc95e6bee'
            '58ec195f340e1cd1f93f469a87afe24b2dbaeb970030cf00e50bbe3b83a9c7b9'
            '3d2ecea0ceb204b754aac4640bfc8337eecf09a0c5227170b6ee1c26089747eb')

latestver() {
    curl -fsSL "https://api.github.com/repos/Maxteabag/${_name}/releases/latest" |
        jq -r '.tag_name' | sed 's/^v//'
}

prepare() {
    cd "${srcdir}"
    sha256sum -c "${_name}-linux-x86_64.SHA256SUMS"
}

package() {
    install -Dm755 "${srcdir}/${_name}-linux-x86_64" "${pkgdir}/usr/bin/${_name}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
