# Maintainer: Xiaomony <x2976113702@gmail.com>
pkgname=tram_btrfs
pkgver=1.0.6
pkgrel=1
pkgdesc="A TUI Btrfs snapshot manager"
arch=('x86_64')
url="https://github.com/Xiaomony/tram_btrfs"
license=('GPL-3.0-or-later')

depends=('btrfs-progs')
makedepends=('cargo' 'git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")

sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}"
    binary="./target/release/${pkgname}"

    # binary
    install -Dm755 "${binary}" \
        "${pkgdir}/usr/bin/${pkgname}"

    # systemd service
    install -Dm644 "packaging/systemd/${pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # license
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # shell completion
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    "${binary}" completion bash >"${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

    install -d "${pkgdir}/usr/share/zsh/site-functions"
    "${binary}" completion zsh >"${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${binary}" completion fish >"${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
