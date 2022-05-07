# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=22.4.5.9
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('x86_64')
url='https://clickhouse.tech/'
license=('Apache')
depends=('tzdata' 'libcap')
noextract=(
  clickhouse-client_${pkgver}_all.deb
  clickhouse-common-static_${pkgver}_amd64.deb
  clickhouse-server_${pkgver}_all.deb
)
source=(
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-client_${pkgver}_all.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-common-static_${pkgver}_amd64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-server_${pkgver}_all.deb
)
sha256sums=(
  b408e1479eb8e72d89f4cb8a1c310d2abd73e40247cbaa7000f55421b3c865e9
  7372591360497670b736697d3bd7d1548f0761adab0295c8d03102368ab552e0
  22e685245f5a5bcb42d020050cb363ebca2e8058eb31c2be6ea702d42646e6d8
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
