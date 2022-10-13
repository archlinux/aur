# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=22.8.6.71
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time. LTS version'
arch=('x86_64' 'aarch64')
url='https://clickhouse.com'
license=('Apache')
depends=('tzdata' 'libcap')
provides=(clickhouse)
conflicts=(clickhouse)
_source_prefix='https://packages.clickhouse.com/deb/pool/main/c/clickhouse'
source_x86_64=(
  "${_source_prefix}/clickhouse-client_${pkgver}_amd64.deb"
  "${_source_prefix}/clickhouse-common-static_${pkgver}_amd64.deb"
  "${_source_prefix}/clickhouse-server_${pkgver}_amd64.deb"
)
sha256sums_x86_64=(
  c06132d0ac42090d3eb368d89b7aa6db74ba5d047afdd72cd1297e73a43a3c95
  c99dc49ca3dd79512d0cc3310f3ca88a5a37345453cbd73f214b79dff389f63e
  4436e2503efa9da40603263da64b619e2573396c629d1f6e77f3ea333254ec4e
)
source_aarch64=(
  "${_source_prefix}/clickhouse/clickhouse-client_${pkgver}_arm64.deb"
  "${_source_prefix}/clickhouse/clickhouse-common-static_${pkgver}_arm64.deb"
  "${_source_prefix}/clickhouse/clickhouse-server_${pkgver}_arm64.deb"
)
sha256sums_aarch64=(
  c0919bf4559e03a1a9801b87ce04464df1ba0e07cdd330518299bcaa8829a26d
  3a9a4f1ef24c5cb5c93e9f16a196c178d559f6eefafdc90ff4fc1a152d1ebf79
  20cf8b0bd8c20c1f3730854775e13601d224958c249b4b0654bef50ad6118ee1
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
