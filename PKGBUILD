# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=26.8.2.7
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
sha256sums_x86_64=('0d4d9dbbde6c7c8e1b1216d720c27ae8a20171607478af1d16dcb7a3566f5fe2'
                   '5c8a1308bd443d4755dee2a67495c86d35ec23205ead206802d0b3d265ad1444'
                   '2320bce91a17953e007db06473871f215a081b4e8ede0c55120b5566141d2619')
sha256sums_aarch64=('04d5194d608e0a2a299f44969afcf6d6c72f1c37bed92c0e172bef22cf6d2640'
                    'f67ff96e44dc6252424bcf66cf2b4dac3297eb562f5e4315fd09c081c7cf358b'
                    'ba346abe101d01891c145de0342087509e45f8cfa9e131cc1de7a34713268c39')
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

check_version() {
  local version
  version=$(
    curl -s https://raw.githubusercontent.com/ClickHouse/ClickHouse/refs/heads/master/utils/list-versions/version_date.tsv \
    | awk -F'[-v]' '/-lts\t/ {print $2; exit}'
  )
  if ! grep -q "pkgver=$version" PKGBUILD; then
    echo "Update pkgver=$version in PKGBUILD"
    return 1
  fi
}

get_sums() {
  # usage: bash -c 'source PKGBUILD && get_sums'
  check_version || return 1
  makepkg --geninteg
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
