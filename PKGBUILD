# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=22.7.1.2484
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
  b32eee815b176506ba4bb48abebf9d3cecef6d79fd2fc0e40bb8049953f31fcd
  01175dae948d7b5e70014f486ce05daa86a498bb4f0cc81a7196239f737cfb52
  e605c6bf6654809cbe10db83356c6e54add5e957a509af1c85eb7390d66fc194
)
source_aarch64=(
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-client_${pkgver}_arm64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-common-static_${pkgver}_arm64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-server_${pkgver}_arm64.deb
)
sha256sums_aarch64=(
  8a7831754795a93840f25588e9b6c8eb378a76d614250590487eb0d317dbaca2
  ede549996ffff9d3a701365b48b743f31109d70c6f5db1cab5107c56cc4024ce
  0c7a11a073bb28241881bcef221ce3df4adf04432e4b6e702c9e1aa002e2f72e
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
