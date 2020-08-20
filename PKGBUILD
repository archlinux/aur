# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=20.3.17.173
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time. LTS version'
arch=('x86_64')
url='https://clickhouse.tech/'
license=('Apache')
depends=('tzdata' 'libcap')
provides=(clickhouse)
conflicts=(clickhouse)
noextract=(
  clickhouse-common-static_${pkgver}_amd64.deb
  clickhouse-client_${pkgver}_all.deb
  clickhouse-server_${pkgver}_all.deb
)
source=(
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-common-static_${pkgver}_amd64.deb
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-client_${pkgver}_all.deb
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-server_${pkgver}_all.deb
)
sha256sums=(
  c4d8dd667dc21f616f0f228426badffbd8922223ce0ce79f444537130bad223c
  46180eae29011212c61443ed73b50a27740ab30feb684648d35763310071ee85
  fb782d0309bb9607ca87a7247f3f9dfc7fc8faf542c73459ec69c391ee0cf250
)
install=$pkgname.install
backup=(
  'etc/clickhouse-client/config.xml'
  'etc/clickhouse-server/config.xml'
  'etc/clickhouse-server/users.xml'
)

package() {
  for deb in "${noextract[@]}"; do
    bsdtar -xf $deb
    tar xf data.tar.gz -C "${pkgdir}"
  done

  gzip -d "${pkgdir}/usr/share/doc/clickhouse-server/LICENSE.gz"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/share/doc/clickhouse-server/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/etc/cron.d" \
    "${pkgdir}/etc/init.d" \
    "${pkgdir}/etc/security" \
    "${pkgdir}/etc/systemd" \
    "${pkgdir}/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
