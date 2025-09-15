# Maintainer: Rin <icealtria at gmail dot com>

pkgname=geph5-client
pkgver=0.2.83
pkgrel=1
pkgdesc="The command-line Geph5 client"
arch=('x86_64')
url="https://github.com/geph-official/geph5"
license=('MPL-2.0')
backup=('etc/geph5-client/config.yml')
provides=('geph5-client')
conflicts=('geph5-client-git')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "config.yml"
        "geph5-client.user.service"
        'geph5-client.service')
md5sums=('7c393ca24d5b691f503028413dcbd28f'
         '5d667053a82c655146baec7446b35e62'
         '186cca941b1c4a510a71bf79a0ef8921'
         '7ddb81dd9b4a9f66559247565cdb49a7')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"/
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS+=" -ffat-lto-objects" # https://github.com/launchbadge/sqlx/issues/3149
  cd "${pkgname}-${pkgver}"/
  cargo build --frozen --release --features aws_lambda
}

package() {
  cd "${pkgname}-${pkgver}"/
  install -Dm0644 "${srcdir}"/geph5-client.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm0644 "${srcdir}"/geph5-client.user.service "${pkgdir}"/usr/lib/systemd/user/geph5-client.service
  install -Dm0644 "${srcdir}"/config.yml ${pkgdir}"/etc/geph5-client/config.yml"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/geph5-client"
}

