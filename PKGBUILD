# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=flexo
pkgrel=3
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
install='flexo.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nroi/${pkgname}/archive/${pkgver}.tar.gz"
        'sysuser.conf'
        'flexo.install'
        'flexo.service')
sha256sums=('c51484fa8935e520bbfbcf74a76f6a09b77e4e14a4206a6446490c445e0eb1e7'
            'b6a618c66d3ffb9ad119b0497d2181cdd382ec870cc768606debed40716c1f4e'
            '662e8c6c4d024ec035c2c02d9298a8cb6062cfb30d02bfaecf17a9d3d9b35167'
            '3b38503a554cc179e33f5c337cbbd0186d03069d059d534e220882407d550f48')

prepare() {
    cd "${pkgname}-${pkgver}/flexo"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}/flexo"
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}/flexo"
    cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/flexo.service" "${pkgdir}/usr/lib/systemd/system/flexo.service"
  install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/flexo.conf"
  install -Dm644 "./flexo/conf/flexo.toml" "${pkgdir}/etc/flexo/flexo.toml"
  install -Dm755 "./flexo/target/release/flexo" "${pkgdir}/usr/bin/flexo"
  install -Dm755 "./flexo_purge_cache" "${pkgdir}/usr/bin/flexo_purge_cache"
}
