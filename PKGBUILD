# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=25.3.3.42
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
sha256sums_x86_64=(
  3ce6a59b51596b5957e20be52e000e345ee14ed8e89c6aa7ca6c82bae5f06039
  efa82d2cd98e268b397513470e6aeea85286124a0b672b572d73c7b7b1e10dc3
  aae28e9aa2ef69a829765535819a4b7aefe4235fad30cfeeb949885f5b40c5f1
)
sha256sums_aarch64=(
  c6d2c99a22ab19b018b1520af45c22bf398b099f1cae62e455fc4b3e10a20062
  a2f8e5f39629540d7988e15718c6cb3971c18da4a55f5e0b27c0b3a69dbe8e68
  25fea689620094b9ada19d892f4ff264253c7664419bf48306fb67766244a5dc
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
provides=(clickhouse-client clickhouse-server clickhouse-keeper clickhouse-common-static)
conflicts=(clickhouse-client clickhouse-server clickhouse-keeper clickhouse-common-static)

get_sums() {
  for CARCH in x86_64 aarch64; do
    pkgver=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=);
    CARCH=$CARCH makepkg --verifysource --nobuild --noextract;
  done
  for CARCH in x86_64 aarch64; do
    [ "$CARCH" == aarch64 ] && arch=arm64 || arch=amd64;
    echo "sha256sums_${CARCH}=("
    sha256sum clickhouse*"${pkgver}_${arch}.deb" | sed -r 's|(\w+).+|  \1|';
    echo ')'
  done
}

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
