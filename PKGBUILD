# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=22.8.1.2097
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
8dcc12cdd790718e6b18825ad21046cbf5cf4d9217706fa6cfd537801f3c3756
cb2efc24ce2765fdbe4c3b2a08e08db6fd13c58af02a2ad5b5b546e7a0209200
85e3e8be06e0358a0f5603a3b3a26fc9ec2a6d3c0d96dba79fd22c85d6cfa4ab
)
source_aarch64=(
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-client_${pkgver}_arm64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-common-static_${pkgver}_arm64.deb
  https://packages.clickhouse.com/deb/pool/stable/clickhouse-server_${pkgver}_arm64.deb
)
sha256sums_aarch64=(
18585d8533bcf20775d8bdd89689f5eac1f703dea9e2dd5f25fee1ab0b2dad2a
99cefe2aaa22737f26ec98cc64383ed3651fed59d2c30b71b8821ab794d54c78
3427bf8e94443b7555ce022518ac2c96409fe970c42e9814441ac30331d601f7
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
