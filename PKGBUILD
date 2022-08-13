# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=flexo
pkgrel=1
pkgver=1.6.7
pkgdesc='A central pacman cache'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/nroi/${pkgname}"
license=('MIT')
provides=('flexo')
conflicts=('flexo-git')
makedepends=('rust' 'git')
depends=('curl' 'pacman-contrib')
backup=('etc/flexo/flexo.toml')
install='flexo.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nroi/${pkgname}/archive/${pkgver}.tar.gz"
        'sysuser.conf'
        'flexo.install'
        'flexo.service')
sha256sums=('c8f8efbd8fcd84c7c22f1fe1b7e3945b1036134eb546b80d3e8109f44330593f'
            'b6a618c66d3ffb9ad119b0497d2181cdd382ec870cc768606debed40716c1f4e'
            '662e8c6c4d024ec035c2c02d9298a8cb6062cfb30d02bfaecf17a9d3d9b35167'
            '0ba13ff1d92b51433635e1fbf5f1017e3e06b3e408be663acb1fbf65f344a3ad')

build() {
  cd "${pkgname}-${pkgver}/flexo"
  cargo build --release --locked
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
