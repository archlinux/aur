# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse
pkgver=26.3.5.12
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
sha256sums_x86_64=(
  c99aac4b8b747bec117c6e7b1fad691becb619b45829bcb45df9d3cb108c9e82
  41971fd309d684b7475325cefe113cdc82574d43faa9443b3e11e2a59c1b6a32
  bf01ab01d8d53cb7b603f896db8b2adf79d110f8fa24b36a96f96233dd4aa08e
)
sha256sums_aarch64=(
  1668f6fd9f553217412e537b68098cd44e8f2c97d6869be7394f1c0b337f50d6
  6a0a02e12f60f0ee227ce280c3be49fdbbcd50bdfe0e8e54324a1c6c9d9ba5d6
  648d55830cc8b88554b2d33153355d4959966fce386b74138c9ed19c8c3dc808
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
provides=(clickhouse-client clickhouse-server clickhouse-keeper clickhouse-common-static chdig)
conflicts=(clickhouse-client clickhouse-server clickhouse-keeper clickhouse-common-static chdig)

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
