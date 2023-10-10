# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=23.9.1.1854
pkgrel=1
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
source_aarch64=(
  "${_source_prefix}/clickhouse-client_${pkgver}_arm64.deb"
  "${_source_prefix}/clickhouse-common-static_${pkgver}_arm64.deb"
  "${_source_prefix}/clickhouse-server_${pkgver}_arm64.deb"
)
# for CARCH in x86_64 aarch64; do;
#   pkgver=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=);
#   CARCH=$CARCH makepkg --verifysource --nobuild --noextract;
# done
# for CARCH in x86_64 aarch64; do;
#   [ "$CARCH" == aarch64 ] && arch=arm64 || arch=amd64;
#   echo "sha256sums_${CARCH}=("
#   sha256sum clickhouse*"${pkgver}_${arch}.deb" | sed -r 's|(\w+).+|  \1|';
#   echo ')'
# done
sha256sums_x86_64=(
  c6b8c6c3641f80356504a4125fb43b2f49aa91b0b99b3c2a46585b8ede8d0865
  7127d1c31b70cfa81723c321c9d2d6a5d064233417fe6dacdeec1cc0dd205ec3
  6dd09b4c16f5ccca2a619eaa10df712994d024538ff7b550e2aa6ea6cc6d975f
)
sha256sums_aarch64=(
  ad10c3ae26f8488bea97745a88496716ba914aeac20465e23e3e376224e756d3
  c1af443e94844baf048e574bed7d34e14b320b5f388ac0aa7578242c0ee845f1
  e6a9f414f04064b2d1a19207007c2db94c04db5eabf4b834a214ec9ed73f7444
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
