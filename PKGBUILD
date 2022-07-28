# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=22.3.9.19
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time. LTS version'
arch=('x86_64' 'aarch64')
url='https://clickhouse.com'
license=('Apache')
depends=('tzdata' 'libcap')
provides=(clickhouse)
conflicts=(clickhouse)
source_x86_64=(
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-client_${pkgver}_amd64.deb
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-common-static_${pkgver}_amd64.deb
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-server_${pkgver}_amd64.deb
)
sha256sums_x86_64=(
  9afb1789704d2ed059bc7bf25da1ec2871649cce3b96c7b9065bca4b72304f02
  bf32775a0062f4c776a1f61de17eeb002a41f1a0c53c5f55a0ad2f244daa6985
  f4fed800789587235ba039416e2eed85225395656cc22709685d6811a57a11a8
)
source_aarch64=(
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-client_${pkgver}_arm64.deb
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-common-static_${pkgver}_arm64.deb
  https://packages.clickhouse.com/deb/pool/lts/clickhouse-server_${pkgver}_arm64.deb
)
sha256sums_aarch64=(
  3520deeb50e579bd7bbca68334b96f21f16839c3930e047f79f26a2adc21e9a3
  e0a53be9f4e08c3a21e18b0c08cd08b8ce69c0f2f54b4771e0ab15553e9cba71
  9f93b138061b7d81022e538e0ad03fbd8fcd5d1dca5911bc59b78d824d62ea83
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
