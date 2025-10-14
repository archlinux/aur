# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-lts
pkgver=25.8.10.7
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
  6dde84d5f1313281c2e51b9220862ebff2241828624bcd3ae6cc8b825a646abe
  491ba8eeeccce954894d49376682f91a32f015cf44b544f0ecf6e8ffe0c1bdcf
  693958d0f35c5958b7142d402a195dedef2e4fc699df4e574c664cd279e417d1
)
sha256sums_aarch64=(
  80834852b534258047ca6f1798b81f4c49e835977fbb2388b0cd9c7c464a5d7b
  0632390707e59d3ffe9a23a011e3902f09dd1561665feabfdf7fe5b75771b129
  fe443c7afddeaea635c7ed2f4324906ac23ba18b902f047f937e0fead71dc8e7
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
