# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=flexo
pkgrel=8
pkgver=1.6.9
pkgdesc='A central pacman cache'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/nroi/${pkgname}"
license=('MIT')
provides=('flexo')
conflicts=('flexo-git')
makedepends=('cargo' 'git')
depends=('curl' 'pacman-contrib')
backup=('etc/flexo/flexo.toml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nroi/${pkgname}/archive/${pkgver}.tar.gz"
        'flexo.service'
        'sysuser.conf'
        'tmpfiles.conf')
sha256sums=('c51484fa8935e520bbfbcf74a76f6a09b77e4e14a4206a6446490c445e0eb1e7'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${pkgname}-${pkgver}/flexo"
    export RUSTUP_TOOLCHAIN=stable
    cargo update rustc-serialize  # see https://github.com/nroi/flexo/commit/22695323b84f72565e6ba289f150733eee228bd6
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}/flexo"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}/flexo"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --bins
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE

    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/flexo.service"
    install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/flexo.conf"
    install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/flexo.conf"

    install -Dm644 -t "${pkgdir}/etc/flexo/" flexo/conf/flexo.toml

    install -Dm755 -t "${pkgdir}/usr/bin/" flexo/target/release/flexo
    install -Dm755 -t "${pkgdir}/usr/bin/" flexo_purge_cache
}
