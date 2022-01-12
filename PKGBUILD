# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=21.8.12.29
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
  7c61de15f53f76ed2ac65c8b90238b67281f6047f838757c7b8bf7c698826e7d
  209a7bba90e27498e95ca105ce6aaa28d487f108d11c9b4541ee1f6b213cd1cb
  4b6590a736bbb6c475d421c4baad42347556623719758445e5544a194b7b102d
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
