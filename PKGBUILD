# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=git-gone
pkgver=1.2.4
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://github.com/swsnr/git-gone"
license=('Apache-2.0')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo' 'asciidoctor')
options=("!lto")
source=(
    "${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.zst"
    "${pkgname}-vendor-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/vendor.tar.zst"
    "config.toml"
)
sha256sums=('3d32e837480000ecdb4ccf30bc7239c0347ffeaedf9daea1288a8181d8541d15'
            'fb193d187d927b37a51e3a6a28284ad1c3e0a7ae6736da559b232107aa681c5b'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881')

prepare() {
    cd "${pkgname}-v${pkgver}" || return 1

    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "${pkgname}-v${pkgver}" || return 1

    # Link against system libgit2 instead of building an embedded copy
    export LIBGIT2_SYS_USE_PKG_CONFIG=1

    cargo build --release --locked
    asciidoctor -b manpage -a reproducible git-gone.1.adoc
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-v${pkgver}/git-gone.1" "${pkgdir}/usr/share/man/man1/git-gone.1"
}
