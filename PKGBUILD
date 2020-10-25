# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=20.10.2.20
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
  https://repo.clickhouse.tech/deb/stable/main/clickhouse-client_${pkgver}_all.deb
  https://repo.clickhouse.tech/deb/stable/main/clickhouse-common-static_${pkgver}_amd64.deb
  https://repo.clickhouse.tech/deb/stable/main/clickhouse-server_${pkgver}_all.deb
)
sha256sums=(
    5e06b6ca777fc1156efabcb1aaa27218b744327f8f4b5644d85b65dbef6b4f93
    6984d4481d24ab190bfda03ea3e2d279c1d6fd54849bf3881d06070b2acef173
    10ea67b79a59560da5694e8b1669b5ebd099a9e4a06614376c6cd89e203297da
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

  gzip -d "${pkgdir}/usr/share/doc/${pkgname}-server/LICENSE.gz"
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
