# Maintainer: Mekyt <hello at mek dot yt>

pkgname='appflowy-cloud'
pkgver=0.1.28
pkgrel=3
pkgdesc='Note, project and knowledge management'
arch=('x86_64')
url='https://github.com/AppFlowy-IO/AppFlowy-Cloud'
license=('AGPL 3.0')
depends=('sqlx-cli')
makedepends=('cargo')
optdepends=(
  'nv: Systemd service support'
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
  '15ce521dee69b325e9d5070cdd3a378c1cc4a083ef7c566e36a135323078af820e2528dc6863fc62cf2ed54f2d6beac9cf15cedc76b3a00c0816ccd3659e9bc5'
  '20125987d80de0f5d0bbf7b83e9b98aa8d6b171d093e1f4d50529b39ff0fb8516e6b0556cd1fc72af9c253adeb4a4dc248a9ee9ddf4bc461b3985898cdf4fe3b'
  'f2dbffb9216e5feff4fb36ca0c79e65a17f19bd17b0f5f63fc504245aff9534a1c2324e1843eda3365a0ec20ff00c34984793710b747cec73da0568aee19f1b4'
  'e57e1b59e78c97f35d5c6d72dd2b3b343e0955c4983d93c26ecaeab44a7bdea6d202bd36c666f77061b5381f26727e5fcd0d08e47441907b767219d9dc4f2afe'
)
options=(!lto)
backup=('etc/appflowy/config.env')

build() {
    cd "AppFlowy-Cloud-${pkgver}"
    export SQLX_OFFLINE=true

    cargo build -p realtime-entity
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
