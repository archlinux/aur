# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='5fec1d1a99f66e4f545542622d113a95ece4321d'
pkgname=rustic-server
pkgver=2024.02.18
pkgrel=1
pkgdesc='A REST server built in rust for use with rustic/restic'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/rustic-rs/rustic_server'
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
backup=("etc/${pkgname}/${pkgname}.conf")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rustic-rs/${pkgname//-/_}/archive/${_commit}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
b2sums=('063efa71af355e6580d8be6577b842221f2f1311fea666e9fa576477e80701bc9880fbb9d35c1e35fddf5e888792fb0db0ad34af047f58f18247b345c3bbae7f'
        'bbbf59fe785699691e5442e36cdc7d1a87a62aaaec3baf73bf000332ac05676cbde61796b87d963fc2d6633ee0bc2e066329acfbf59974192cec52424e9870c9'
        '8b5cab1031349b33300b3f41fe1635fb665e406a7dbe7c00a7bc984b9adcae5ab8a63c39ba211c6e3ad884fd78b84c38542bf5431a6c27c7e0a1a3c5ad13972c'
        '612d6f5bad1c236be078c377db8e00536677860cbc0597c57017630908c7130738e59237660c76e56306691cdcf39c88b9ad97ef99f70a9562d4512aa89e89aa'
        'c59c53a663c85f9c8ef2cbaee3a0e8e742f1db768df91a997e3abcfa19790405209d1286ecdff3accb2f664f70af8a92b074a0595cb55f455c1b4193bd21bdaf')

prepare() {
  cd "${pkgname//-/_}-${_commit}"
  cargo update
  cargo fetch --locked
}

build() {
  cd "${pkgname//-/_}-${_commit}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname//-/_}-${_commit}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # config
  install -Dm644 "${srcdir}/${pkgname//-/_}-${_commit}/config/acl.example.toml" \
    "${pkgdir}/etc/${pkgname}/acl.example.toml"
  install -m644 "${srcdir}/${pkgname}.conf" \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  # readme
  install -Dm644 "${srcdir}/${pkgname//-/_}-${_commit}/README.md" \
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
