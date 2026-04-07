# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=26.3.3.20
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
  095498482e5f0fa071d1cc914cff1712b4a869251976789b17f9354c2630ec05
  9f9845c8f2101d9b7da56ad0fbdbf93f96a34b80aabff44436d33f773b5ce1cf
  5712ac1adaa5eee6a7db84530455c8330171449ff4083a28cab6fe5f95760db5
)
sha256sums_aarch64=(
  1063dd5c8354725699754ffce5ff7ee2bb166ca6dc2856220c2e4f39e6a8e4c0
  f4c6af401594c69ad40748c5854ecdfb73a30321d51abe6fd71ee3188b1c085c
  db8ed534e0f4f292a63c7b29175aebc0eb9d1e7c17ba08b75f1861a8791dba64
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
  # usage: bash -c 'source PKGBUILD && get_sums'
  for CARCH in x86_64 aarch64; do
    pkgver=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=);
    CARCH=$CARCH makepkg --verifysource --nobuild --noextract;
  done
  for CARCH in x86_64 aarch64; do
    [ "$CARCH" == aarch64 ] && pkg_arch=arm64 || pkg_arch=amd64;
    echo "sha256sums_${CARCH}=("
    sha256sum clickhouse*"${pkgver}_${pkg_arch}.deb" | sed -r 's|(\w+).+|  \1|';
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
