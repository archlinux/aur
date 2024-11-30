# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rustic-server
pkgver=0.4.4
pkgrel=1
pkgdesc='A REST server built in rust for use with rustic/restic'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/rustic-rs/rustic_server'
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
backup=("etc/${pkgname}/${pkgname}.conf")
source=("${pkgname}::git+https://github.com/rustic-rs/${pkgname//-/_}.git#tag=v${pkgver}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.toml")
b2sums=('3192a666945c33f89ad8fc1c1c9bd9695c4d6cffae08ea1bb142ba18ea2699d7be32d7f02bbdafb80ab1686264685db9ad976491854fcd6b58b71fae15a794e8'
        '716f59b0ed3981b8d495c521a8f675a7f2427f5f07d0d06350c1d7579c2fc42fe74c6b07aadb60f505a5c442b7eb020620fabb15f6948386e8c21bab1de00231'
        '612d6f5bad1c236be078c377db8e00536677860cbc0597c57017630908c7130738e59237660c76e56306691cdcf39c88b9ad97ef99f70a9562d4512aa89e89aa'
        '6fe53d86b4580fc90f3ef46310d89b4d08c1374077606b94c887e92807a97f3bd8af91b68efeec5d3506ba588f648b493820268bd001538355d591c4ae5c470b'
        '289a73218df2a38476ab80450702399d011afa193511272fc7a641f7983a42ae11f2563fe9410ec2fe90edbb985f915abc644a92756e80eafa88b66b3975f711')

prepare() {
  cd "${pkgname}"
  cargo update
  cargo fetch --locked
}

build() {
  cd "${pkgname}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # config
  install -Dm644 "${srcdir}/${pkgname}/config/acl.example.toml" \
    "${pkgdir}/etc/${pkgname}/acl.example.toml"
  install -m644 "${srcdir}/${pkgname}.toml" \
    "${pkgdir}/etc/${pkgname}/${pkgname}.toml"
  # readme
  install -Dm644 "${srcdir}/${pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  # sysusers and tmpfiles
  install -Dm644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
