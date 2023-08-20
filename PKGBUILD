# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=1.0.0
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://github.com/swsnr/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('e3ee88bc3ffd8f1ec694ab93083aac8215edfc797266598a293baaa465aa81baca54dc7e8b6c3f547a470c4e4bf322320f02921bb6556c6bd2de1c7446f064fe')

build() {
    cd "${pkgname}-${pkgver}" || return 1

    # Use fat LTO objects to allow LTO with Rust
    export CFLAGS+=' -ffat-lto-objects -w'
    # Link against system libgit2 instead of building an embedded copy
    export LIBGIT2_SYS_USE_PKG_CONFIG=1

    cargo build --release --locked
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/git-gone.1" "${pkgdir}/usr/share/man/man1/git-gone.1"
}
