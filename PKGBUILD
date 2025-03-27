# Maintainer: Mekyt <hello at mek dot yt>

pkgname='appflowy-cloud'
pkgver=0.9.35
pkgrel=0
pkgdesc='Note, project and knowledge management'
arch=('x86_64')
url='https://github.com/AppFlowy-IO/AppFlowy-Cloud'
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'sqlx-cli')
makedepends=('cargo')
optdepends=(
  'gotrue: Authentication'
  'minio: MinIO support'
  'postgresql: PostgreSQL support'
  'redis: Redis support'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/AppFlowy-IO/AppFlowy-Cloud/archive/refs/tags/${pkgver}.tar.gz"
  'appflowy-cloud.service'
  'appflowy-cloud@.service'
  'appflowy.sysusers'
)
b2sums=(
  'b46a91d29d47f8e7eb6b0ba3b02df6b089926de9e62e1e0d391f608efb7601461d9a22641ba7934f5d0174e07120315617280be5ef9aea754260175038425c00'
  '8255a2305e058e9326e1b37b63d43b2da9a49339f5379d052cea5667df0a012da26823a4b71dd6da5f53791a2e4d3e86319ceb605d7e4c5358f72cc28a43c673'
  '4153a806bbd9633c7975083215c60616d67d2028ae0faa5db701b70769c4776542a368ea308c3ed51b970c2273dae2a61daada78984084cf5381a9820c9aeb5a'
  'e57e1b59e78c97f35d5c6d72dd2b3b343e0955c4983d93c26ecaeab44a7bdea6d202bd36c666f77061b5381f26727e5fcd0d08e47441907b767219d9dc4f2afe'
)
options=(!lto)
backup=('etc/appflowy/config.env')

build() {
    cd "AppFlowy-Cloud-${pkgver}"
    export SQLX_OFFLINE=true

    cargo sqlx prepare --check
    cargo build --release
}

package() {
    install -Dm 644 appflowy-cloud.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 appflowy-cloud@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 appflowy.sysusers "${pkgdir}/usr/lib/sysusers.d/appflowy.conf"

    cd "AppFlowy-Cloud-${pkgver}"

    install -Dm 755 "target/release/appflowy_cloud" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 dev.env "${pkgdir}/etc/appflowy/config.env"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -dDm 644 migrations "${pkgdir}/usr/share/${pkgname}/migrations"
}
