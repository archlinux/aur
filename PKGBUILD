# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=git-gone
pkgver=1.2.7
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://codeberg.org/swsnr/git-gone"
license=('Apache-2.0')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo' 'openssh')
options=("!lto")
source=(
    "${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.zst"
    "${pkgname}-v${pkgver}.tar.zst.sshsig::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.zst.sig"
    "${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-vendor.tar.zst"
    "${pkgname}-v${pkgver}-vendor.tar.zst.sshsig::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-vendor.tar.zst.sig"
    "config.toml"
)
sha256sums=('cb6f156218d2bd54bd8138a673d0a90f22c2adc0d63ad0103390cf99c1686ffb'
            'SKIP'
            'e05ab06f4ba48f98d38c451d129e7f9e5f61122158a696775abdaf5ee34b9105'
            'SKIP'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881')

verify() {
    echo "sebastian@swsnr.de ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBmga3fwFXxHTireSwL/YLdNpOuQcJXB8hW4FwOc6SCm" > allowed-signers
    ssh-keygen -Y verify -f allowed-signers -I sebastian@swsnr.de -n file -s "${pkgname}-v${pkgver}.tar.zst.sshsig" < "${pkgname}-v${pkgver}.tar.zst"
    ssh-keygen -Y verify -f allowed-signers -I sebastian@swsnr.de -n file -s "${pkgname}-v${pkgver}-vendor.tar.zst.sshsig" < "${pkgname}-v${pkgver}-vendor.tar.zst"
}

prepare() {
    cd "${pkgname}-v${pkgver}" || return 1

    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "${pkgname}-v${pkgver}" || return 1

    # Link against system libgit2 instead of building an embedded copy
    export LIBGIT2_SYS_USE_PKG_CONFIG=1
    cargo build --release --locked
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
