# Maintainer: Puqns67 <me@puqns67.icu>

pkgname='rustdesk-server'
pkgver='1.1.14'
pkgrel=4
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
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf"
        "${pkgname}-hbbr.service"
        "${pkgname}-hbbs.service"
        "${pkgname}-hbbr.default"
        "${pkgname}-hbbs.default")

b2sums=('8518ca0011823539c2987ee8460cfba5aa1f21cfa06dd7822e81563f6dd7e6b01c47c7598f49166e597da67ba5084860d4dc1e16c811343980d9e12548605d38'
        '736e07c9f81ca791e1ca05a209eb7551d6b87250f12554dbeb13b46f98795a3bcc556fc9548d856223b10566729988485e0376022afb1b59a333ec03d3b47cea'
        'ef24fd0191b6cb1e4a1919ea579f1568ceeccf58c562316990c5697c1a593d6e1bdaa780bde115a1f7bd6556c128b68515f5fb4e535c805a35b338fc3fca232a'
        'e36c0824b5ac118f6b353abe1a1185b329e9d9ed4d84bb1203cb9d72fd955c8e744dae400dc037ba6a95876b4431cb532388b8562d3cda0583ebf23e15d89854'
        '35501797bfa694a142de698aa60db169eae91ff436d05bf0d13b1fc7c8131c6a87a4a101b918edd0432de7a9047d16804f5c5b22d737bee49329191a1e00d2c5'
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

  install -Dm644 "${srcdir}/${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  install -Dm644 "${srcdir}/${pkgname}-hbbr.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-hbbr.service"
  install -Dm644 "${srcdir}/${pkgname}-hbbs.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-hbbs.service"

  install -Dm644 "${srcdir}/${pkgname}-hbbr.default" "${pkgdir}/etc/default/${pkgname}-hbbr"
  install -Dm644 "${srcdir}/${pkgname}-hbbs.default" "${pkgdir}/etc/default/${pkgname}-hbbs"
}
