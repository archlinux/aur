# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo
pkgver=0.9.6
pkgrel=1
pkgdesc='Full featured and highly configurable SFTP server'
arch=('i686' 'x86_64')
url="https://github.com/drakkan/${pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'git' 'go')
optdepends=(
  "sqlite: to use SQLite provider"
  "postgresql: to use PostgreSQL provider"
  "mariadb: to use MySQL provider"
  "python-requests: REST API CLI"
  "python-pygments: REST API CLI colors highlight"
)
backup=("etc/${pkgname}/sftpgo.json")
install=${pkgname}.install

source=("git+https://github.com/drakkan/${pkgname}#tag=${pkgver}"
  "sftpgo.json"
  "README")
sha256sums=('SKIP'
  'c1defd385855fc88a780a611b9076f24c61663123480ba14eee5f37f0396df86'
  '444c3e192a9d75be7d7d15bd75f598df8a400e5431855a787cd8dc5a87187309')

build() {
  cd "${pkgname}"
  go build -i -ldflags "-s -w -X github.com/drakkan/sftpgo/utils.commit=`git describe --always --dirty` -X github.com/drakkan/sftpgo/utils.date=`date --utc +%FT%TZ`" -o sftpgo
}

package() {
  cd "${pkgname}"
  install -Dm 755 sftpgo "$pkgdir/usr/bin/${pkgname}"
  install -Dm 755 scripts/sftpgo_api_cli.py "${pkgdir}"/usr/bin/sftpgo_api_cli
  install -Dm 644 init/${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/sftpgo.json" -t "${pkgdir}/etc/${pkgname}"
  install -d "${pkgdir}/var/lib/${pkgname}"
  cp -r templates "${pkgdir}/var/lib/${pkgname}/"
  cp -r static "${pkgdir}/var/lib/${pkgname}/"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r sql "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm 644 "$srcdir/README" "${pkgdir}"/usr/share/doc/${pkgname}/README
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
