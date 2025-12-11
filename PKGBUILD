# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=stump
pkgver=0.0.12
pkgrel=1
pkgdesc='A free and open source comics, manga and digital book server with OPDS support'
arch=(x86_64)
url='https://github.com/stumpapp/stump'
license=('MIT')
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
  npm
  yarn
)
checkdepends=()
optdepends=()
backup=()
options=(!lto)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('6a93cf4aa70db7d978c476d268d766a054482afccb7160f5e24351309276d2c5'
            '0acbaeaeec495b4ae9e55401edb4d1f395fb3b2edc68d8c41f0d9fffe925f0ea'
            'da29676564e82d6b642b433156e679055d776c790f61356b64a0a5d65be476ef'
            '366d457de40ce59aa50fe860a21b8db2db84a8fd48fc2a68f38b0eff2ec73dcc')

prepare() {
  cd "${pkgname}-${pkgver}"

  yarn install --frozen-lockfile

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CARGO_TARGET_DIR=target
  export GIT_REV=681b131

  yarn web build

  cargo build --package prisma-cli --bin prisma-cli --frozen --release
  target/release/prisma-cli generate --schema=./core/prisma/schema.prisma
  cargo build --package stump_server --bin stump_server --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/stump_server" "${pkgdir}/usr/bin/stump_server"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r "apps/web/dist" "${pkgdir}/usr/share/${pkgname}/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}"
  install -Dm644 stump.service "${pkgdir}/usr/lib/systemd/system/stump.service"
  install -Dm644 stump.sysusers "${pkgdir}/usr/lib/sysusers.d/stump.conf"
  install -Dm644 stump.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/stump.conf"
}
