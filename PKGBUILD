# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=22.7.2.15
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('x86_64' 'aarch64')
url='https://clickhouse.com'
license=('Apache')
depends=('tzdata' 'libcap')
source_x86_64=(
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-client_${pkgver}_amd64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-common-static_${pkgver}_amd64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-server_${pkgver}_amd64.deb
)
sha256sums_x86_64=(
b1f37588026ac4a8332ae8da39d0a12ca8a85060209d403017bcb7d4fb238274
359e63b81bc1b6d62266a8f21b5e7183e4a190b60197a4a19a1f1b5d3e2b172b
e8b4fe6be0b833b347f2802c604ebc9658591b854726e15c97b27eeec6a6535d
)
source_aarch64=(
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-client_${pkgver}_arm64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-common-static_${pkgver}_arm64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-server_${pkgver}_arm64.deb
)
sha256sums_aarch64=(
bc016815bec2ded1b60082469ce4e1574d3f2a739d758b137b066973919bf1c0
700e983b254ed03e9e9b40dd66fc99488dfd877bbc93b21542aa51d2faeacdd5
53478e238411bc14efe1aab2b8af5b1f28ca53e397541224f77f4951bf3d728f
)
_noextract_x86_64=(
  clickhouse-client_"${pkgver}"_amd64.deb
  clickhouse-common-static_"${pkgver}"_amd64.deb
  clickhouse-server_"${pkgver}"_amd64.deb
)
_noextract_aarch64=(
  clickhouse-client_"${pkgver}"_arm64.deb
  clickhouse-common-static_"${pkgver}"_arm64.deb
  clickhouse-server_"${pkgver}"_arm64.deb
)
noextract=(
  "${_noextract_x86_64[@]}"
  "${_noextract_aarch64[@]}"
)
install=$pkgname.install
backup=(
  'etc/clickhouse-client/config.xml'
  'etc/clickhouse-server/config.xml'
  'etc/clickhouse-server/users.xml'
)

package() {
  debs="_noextract_${CARCH}[@]"
  for deb in "${!debs}"; do
    bsdtar -xf "$deb"
    tar xf data.tar.gz -C "${pkgdir}"
  done

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
