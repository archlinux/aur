# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=21.8.10.19
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time. LTS version'
arch=('x86_64')
url='https://clickhouse.tech/'
license=('Apache')
depends=('tzdata' 'libcap')
provides=(clickhouse)
conflicts=(clickhouse)
noextract=(
  clickhouse-client_${pkgver}_all.deb
  clickhouse-common-static_${pkgver}_amd64.deb
  clickhouse-server_${pkgver}_all.deb
)
source=(
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-client_${pkgver}_all.deb
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-common-static_${pkgver}_amd64.deb
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-server_${pkgver}_all.deb
)
sha256sums=(
  7b74066ffca07dde45d03ba896038bfed360abd2ae8bd8f71e221fa42833862f
  3057dc0899678d55dc1815e6faf5f2de1bb23ed21bf68a4183659bd68f5549e7
  a1b27f0266a542058a71adf8a52a16f4230cc2e8831d118d471a4f2e39336a95
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
