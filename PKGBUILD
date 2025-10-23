# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgauthor=aquaproj
_pkgname=aqua
pkgname=${_pkgname}-bin
pkgver=2.55.0
pkgrel=2
_pkgvername=v${pkgver}
pkgdesc="Declarative CLI version manager"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('help2man')
depends=('bash')
optdepends=()

install=aqua-bin.install
_checksums="${_pkgname}_${pkgver}_checksums.txt"

source=("${url}/releases/download/${_pkgvername}/${_checksums}")
source_x86_64=("${_pkgname}_${arch[0]}_${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}_${arch[1]}_${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[1]}.tar.gz")

sha256sums=('9e68862a32927a43a81e68cd7639b39470fb43526b1062ffca6931179d58dacc')
sha256sums_x86_64=('cb7780962ca651c4e025a027b7bfc82c010af25c5c150fe89ad72f4058d46540')
sha256sums_aarch64=('d65369f52c9a74a2b0c24f494bfbe639794f4aab7788274e04272740b2c27a16')

verify() {
    local aqua_checksums="${pkgname}_${pkgver}_checksums.txt"

    cp "${_checksums}" "${aqua_checksums}"
    sed -n -i "/aqua_linux_.*.tar.gz$/p" "${aqua_checksums}"
    sed -i -e "s/linux_${_barch[0]}.tar.gz/${arch[0]}_${pkgver}.tgz/g" -e "s/linux_${_barch[1]}.tar.gz/${arch[1]}_${pkgver}.tgz/g" "${aqua_checksums}"

    sha256sum -c --ignore-missing "${aqua_checksums}"
}

prepare() {
    mkdir -p ./man
    mkdir -p ./completions
}

build() {
    cd "${srcdir}/" || exit

    help2man "./${_pkgname}" --output "man/man.1" --no-info

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
    install -Dm644 "./man/man.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

    # Shell autocompletion script
    install -Dm644 "./completions/bash" "${pkgdir}/usr/share/bash-completion/completions/aqua"
    install -Dm644 "./completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_aqua"
    install -Dm644 "./completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/aqua.fish"
}
