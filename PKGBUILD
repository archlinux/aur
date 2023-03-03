# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=22.8.14.53
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
source_aarch64=(
  "${_source_prefix}/clickhouse-client_${pkgver}_arm64.deb"
  "${_source_prefix}/clickhouse-common-static_${pkgver}_arm64.deb"
  "${_source_prefix}/clickhouse-server_${pkgver}_arm64.deb"
)
# for CARCH in x86_64 aarch64; do;
#   pkgver=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=);
#   [ "$CARCH" == aarch64 ] && arch=arm64 || arch=amd64;
#   CARCH=$CARCH makepkg --verifysource --nobuild --noextract;
#   sha256sum clickhouse*"${pkgver}_${arch}.deb" | cut -f1 -d' ';
# done
sha256sums_x86_64=(
  5b667881a7fe9f419c5652dcf52e436b69d0b1e21ed91d48ba9f14c82cf00df2
  3e91d1f55606516d36673c828392651ca3ef0476f223d47543c4a32c199e6fa7
  0d46e6722d9f7d4c4801fe60c62e95f70fa3ee4ac1b5964f76596559c47ca66b
)
sha256sums_aarch64=(
  04f2a631a1aeafd072b4e8b6913a679f2ee9ca214fcf22990ff135a360f4a190
  7bab2ff1980561f207d5429ec810fef03ebce14389efceca3892551f9130ea1c
  7dbaa56f0b2de22088487d57531a513ce42331368d19226261b8214a8031d73f
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
