# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=22.3.7.28
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
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-client_${pkgver}_all.deb
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-common-static_${pkgver}_amd64.deb
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-server_${pkgver}_all.deb
)
sha256sums=(
  0b3a2d0507df34842e24791430ec28d788f657621090c23e958f5a353d707bc7
  ad90bb23ebab661cb47976f4af992be0be1406f8ac9594ac081c3ca129bb325d
  cad792e3fa695e4d2b771e124440032905390aea5b9491c474f7b4a69943d197
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
