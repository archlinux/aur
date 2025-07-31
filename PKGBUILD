# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgauthor=aquaproj
_pkgname=aqua
pkgname=${_pkgname}-bin
pkgver=2.53.8
pkgrel=1
pkgdesc="Declarative CLI version manager"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('help2man')
depends=('bash')
optdepends=()

install=aqua-bin.install

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")

sha256sums_x86_64=('0e665447d1ce73cb3baeb50c0c2e8ee61e7086e7d1dc3a049083282421918140')
sha256sums_aarch64=('82d67c8bd623e17290605f1731e7a11ce57901e4561cfa9dfe857a7b8eaa1ae5')

build() {
    cd "${srcdir}/" || exit

    mkdir -p ./man
    help2man "./${_pkgname}" --output "man/man.1" --no-info
    gzip "./man/man.1"

    mkdir -p ./completions
    "./${_pkgname}" completion bash > "completions/fish"
    "./${_pkgname}" completion bash > "completions/bash"
    "./${_pkgname}" completion bash > "completions/zsh"
}

package() {
    cd "${srcdir}/" || exit

    install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Generated man page
    install -Dm644 "./man/man.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

    # Shell autocompletion script
    install -Dm644 "./completions/bash" "${pkgdir}/usr/share/bash-completion/completions/aqua"
    install -Dm644 "./completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_aqua"
    install -Dm644 "./completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/aqua.fish"
}
