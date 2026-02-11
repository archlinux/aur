# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=25.8.16.34
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
  7fe555f4956fc487734e6f5e311707131a00055fca0ca0a3278ca29791d6a1b8
  7cf31038a1ff7859364225061367e38f943c0e202794b62dc033fda0547d1a15
  f411dc31c168008440263cc37018a9aceb32cb5e2e2586638b0d6c5376189e35
)
sha256sums_aarch64=(
  cc3a5f4e7d892742ee890816b02615f587cb33338e8728998a9710fb2d3e4ca4
  7cb6caa5f371974f56f00bfaf7905a5429ba55f47b0af3adbed0843d3646e7e6
  402bd28f550174d457d3da8e1541325b52d92d4a3473ccac303c97a5e4d8ca61
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
