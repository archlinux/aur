# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=21.3.6.55
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
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-client_${pkgver}_all.deb
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-common-static_${pkgver}_amd64.deb
  https://repo.clickhouse.tech/deb/lts/main/clickhouse-server_${pkgver}_all.deb
)
sha256sums=(
    5c8d593dd7b26a9e3793888dc72613d1d173a042d0c56ac3e555b649cbba15c3
    970ba9504208235bd730d39ed7dc11dc9661d842c6d82eb2b5edf8bf3850f588
    032487c7c6d28918d63dfe9eaa19cf62b39189184654d00a64c44ec0b4610eb0
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
