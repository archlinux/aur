# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=flexo
pkgver=1.6.10
pkgrel=1
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
sha256sums=('bbceefe6b83668a19f73377557099e6b8fdaf06f17aba4a9025b3985f1a0ae4d'
            '3b38503a554cc179e33f5c337cbbd0186d03069d059d534e220882407d550f48'
            '481efe7fe3a0ac094807441718ea2793e848a5a3a3aedc5b896ff60fdce14606'
            '6fadc9b5507ed3dc1b87cecafbdd479adedd067ccb2fb1971917b6310e3adf41')

prepare() {
    cd "${pkgname}-${pkgver}/flexo"
    export RUSTUP_TOOLCHAIN=stable
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
