# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=22.9.3.18
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('x86_64' 'aarch64')
url='https://clickhouse.com'
license=('Apache')
depends=('tzdata' 'libcap')
source_x86_64=(
  https://packages.clickhouse.com/deb/pool/main/c/clickhouse/clickhouse-client_${pkgver}_amd64.deb
  https://packages.clickhouse.com/deb/pool/main/c/clickhouse/clickhouse-common-static_${pkgver}_amd64.deb
  https://packages.clickhouse.com/deb/pool/main/c/clickhouse/clickhouse-server_${pkgver}_amd64.deb
)
sha256sums_x86_64=(
019eaf83edd4731be017cdf90e14b064dfd44f1b8a034878d63b3bbb04647f3d
f480c43c13856d0651bf29ce6b100b3bbd235c90d61cba3a814ab7a200ed6697
cd87f4e7622c50c960836a65840d1aab54223152c108e61c9527fa917588212b
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
