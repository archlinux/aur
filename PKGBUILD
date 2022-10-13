# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=22.9.3.18
pkgrel=2
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('x86_64' 'aarch64')
url='https://clickhouse.com'
license=('Apache')
depends=('tzdata' 'libcap')
_source_prefix='https://packages.clickhouse.com/deb/pool/main/c/clickhouse'
source_x86_64=(
  "${_source_prefix}/clickhouse-client_${pkgver}_amd64.deb"
  "${_source_prefix}/clickhouse-common-static_${pkgver}_amd64.deb"
  "${_source_prefix}/clickhouse-server_${pkgver}_amd64.deb"
)
sha256sums_x86_64=(
  019eaf83edd4731be017cdf90e14b064dfd44f1b8a034878d63b3bbb04647f3d
  f480c43c13856d0651bf29ce6b100b3bbd235c90d61cba3a814ab7a200ed6697
  cd87f4e7622c50c960836a65840d1aab54223152c108e61c9527fa917588212b
)
source_aarch64=(
  "${_source_prefix}/clickhouse/clickhouse-client_${pkgver}_arm64.deb"
  "${_source_prefix}/clickhouse/clickhouse-common-static_${pkgver}_arm64.deb"
  "${_source_prefix}/clickhouse/clickhouse-server_${pkgver}_arm64.deb"
)
sha256sums_aarch64=(
  f4673b57bafed4b83294edfef1daf6b870157852e204c11e40dc8c141f1cf0be
  e89a65ec377b2031dd967395e021d071e5e2ce038614c8b47d62fc9048e2839e
  9a1c2c61fab0350f1306014bb587efa1714df69d442be451addcbc26a00cbbf1
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
