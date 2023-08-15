# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.5.0
pkgrel=3
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://github.com/swsnr/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('501367d4685c2dbbe3d2685544710d634f11623fed108b786c7fca850ebce978d7d724babaeb1e18d16444e54e1434aefb0e7fd09ffde325c4d5fbd3af6b0ac3')

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
