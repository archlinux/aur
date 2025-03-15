# Maintainer: Puqns67 <me@puqns67.icu>

pkgname='rustdesk-server'
pkgver='1.1.14'
pkgrel=3
pkgdesc='RustDesk Server Program'
arch=('x86_64')
url='https://github.com/rustdesk/rustdesk-server'
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'rust')
conflicts=("${pkgname}-bin")
backup=("etc/default/${pkgname}-hbbr"
        "etc/default/${pkgname}-hbbs")
options=('!lto')

source=("${pkgname}"::"git+${url}.git#tag=${pkgver}"
        "${pkgname}-hbbr.service"
        "${pkgname}-hbbs.service"
        "${pkgname}-hbbr.default"
        "${pkgname}-hbbs.default")

b2sums=('8518ca0011823539c2987ee8460cfba5aa1f21cfa06dd7822e81563f6dd7e6b01c47c7598f49166e597da67ba5084860d4dc1e16c811343980d9e12548605d38'
        'd63b263e6de9860553662fa6c99642ffa5655a4d160649ffa82dad2e579b7a9dc41b566eb8e1b5e6211fde4def002fb4b7af8dc94a206078c9f5ffa9fbcbe19f'
        '1cc4fbcd05aba1f700bea17a83cbb16d011aec9b1a16313f2c9b2cfd62ffba1968b592ef3d066b3aae0f64713cd4fdafa1a38e68b03cdc338e8bde877e405c12'
        'b6233f341a96439bd651b191052c06fd3f5518f9d3c91a7a39df0050d199981de7ec2dd4e380b771f30b8b7fc10687f678352b25338dd3390b5cb408b22140fd'
        'eb40517dbd14f51342651baf47b7e4acc8ca454b763efaa110d597243ea96c22bb3b28f3f168285e6ccb8f57584451ada2d0348ba7174ef0dd8a2ff5c0028b7a')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${srcdir}/${pkgname}"

  git submodule update --init

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${srcdir}/${pkgname}"

  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/target/release/hbbr" "${pkgdir}/usr/bin/${pkgname}-hbbr"
  install -Dm755 "${srcdir}/${pkgname}/target/release/hbbs" "${pkgdir}/usr/bin/${pkgname}-hbbs"
  install -Dm755 "${srcdir}/${pkgname}/target/release/rustdesk-utils" "${pkgdir}/usr/bin/rustdesk-utils"

  install -Dm644 "${srcdir}/${pkgname}-hbbr.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-hbbr.service"
  install -Dm644 "${srcdir}/${pkgname}-hbbs.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-hbbs.service"

  install -Dm644 "${srcdir}/${pkgname}-hbbr.default" "${pkgdir}/etc/default/${pkgname}-hbbr"
  install -Dm644 "${srcdir}/${pkgname}-hbbs.default" "${pkgdir}/etc/default/${pkgname}-hbbs"
}
