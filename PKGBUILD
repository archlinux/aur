# Maintainer: Ivy Huang <imyxh@imyxh.net>
# Maintainer: Óscar García Amor <ogarcia@moire.org>
# vim: set tw=0 sw=4 et :

pkgname=taskchampion-sync-server
pkgver=0.7.0
pkgrel=1
pkgdesc="The server Taskwarrior syncs to"
arch=('x86_64' 'aarch64')
url="https://taskwarrior.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
source=(
    "${pkgname}::git+https://github.com/GothenburgBitFactory/taskchampion-sync-server.git#tag=v${pkgver}"
    "${pkgname}.service"
)
b2sums=('36c3e63e2ba365905525faa38595a9a661d62e2571f9e245bcc608ffa550e99f8e47f8255a805a42305dd3e82422a015ba75ffc7e3155b1865cddbe8dfa6b9f2'
        '34e1a8e5ad5781c391448f00bc282a0496715c529d37df01dab6fc38f6782daada1c984cb470cd92769117c5bd1f42276585f8f1b02e30e95b562d2a06329970')

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" "${pkgname}.service"
    install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}/target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/LICENSE"
}
