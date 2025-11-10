# Maintainer: William Varmus <0@willvar.tw>

pkgname=proxysql-bin
pkgver=3.0.2
pkgrel=3
pkgdesc='High-performance MySQL proxy with query routing, caching, and load balancing'
arch=('x86_64')
url="https://proxysql.com/"
license=('GPL3')
depends=('gnutls' 'openssl')
optdepends=('perl: for Galera cluster tools')
provides=('proxysql')
conflicts=('proxysql')
backup=('etc/proxysql.cnf')
install="${pkgname}.install"
source=("proxysql_${pkgver}-ubuntu24_amd64.deb::https://github.com/sysown/proxysql/releases/download/v${pkgver}/proxysql_${pkgver}-ubuntu24_amd64.deb"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('d84b8b0599c4d2c9c0a04e33dfcc89e1cbcde9510a5193a4d1b52002a2a93358'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}"
  # Extract DEB contents
  bsdtar -xf "proxysql_${pkgver}-ubuntu24_amd64.deb"
  mkdir -p extracted
  bsdtar -xf data.tar.* -C extracted
}

package() {
  cd "${srcdir}/extracted"

  # Install binary
  install -Dm755 usr/bin/proxysql "${pkgdir}/usr/bin/proxysql"

  # Install systemd services
  install -Dm644 lib/systemd/system/proxysql.service "${pkgdir}/usr/lib/systemd/system/proxysql.service"
  install -Dm644 lib/systemd/system/proxysql-initial.service "${pkgdir}/usr/lib/systemd/system/proxysql-initial.service"

  # Install sysusers and tmpfiles
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # Install configuration
  install -Dm644 etc/proxysql.cnf "${pkgdir}/etc/proxysql.cnf"

  # Install logrotate config
  install -Dm644 etc/logrotate.d/proxysql "${pkgdir}/etc/logrotate.d/proxysql"

  # Install tools and documentation
  install -Dm755 usr/share/proxysql/tools/proxysql_galera_checker.sh "${pkgdir}/usr/share/proxysql/tools/proxysql_galera_checker.sh"
  install -Dm755 usr/share/proxysql/tools/proxysql_galera_writer.pl "${pkgdir}/usr/share/proxysql/tools/proxysql_galera_writer.pl"

  # Install documentation
  install -Dm644 usr/share/doc/proxysql/README.Debian "${pkgdir}/usr/share/doc/${pkgname}/README.Debian"
  install -Dm644 usr/share/doc/proxysql/copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
