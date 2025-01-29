# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=git-gone
pkgver=1.2.2
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
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "${pkgname}-vendor-${pkgver}.tar.zstd::${url}/releases/download/v${pkgver}/vendor.tar.zstd"
    "config.toml"
)
sha256sums=('e40f1a57bc8d937e71942cb1796b9eceac93066a11ecd455d406b672122b4dc8'
            'f22008a347d53c2597c5cd979eb2ba40d3e3ad68fd88b9a64212e3c05411c8f7'
            '8dc330c974e99a362fd8d27f5d76f485da9559f80d576e0fd9ffb1779e4dd881')

prepare() {
    cd "${pkgname}-${pkgver}" || return 1

    install -D -m644 "${srcdir}/config.toml" .cargo/config.toml
}

build() {
    cd "${pkgname}-${pkgver}" || return 1

    # Link against system libgit2 instead of building an embedded copy
    export LIBGIT2_SYS_USE_PKG_CONFIG=1

    cargo build --release --locked
    asciidoctor -b manpage -a reproducible git-gone.1.adoc
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/git-gone.1" "${pkgdir}/usr/share/man/man1/git-gone.1"
}
