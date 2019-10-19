# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo
pkgver=0.9.3
pkgrel=1
pkgdesc='Full featured and highly configurable SFTP server'
arch=('i686' 'x86_64')
url="https://github.com/giltene/${pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'git' 'go')
optdepends=(
  "sqlite: to use SQLite provider"
  "postgresql: to use PostgreSQL provider"
  "mariadb: to use MySQL provider"
)
backup=("etc/${pkgname}/sftpgo.json")
install=${pkgname}.install

source=("git+https://github.com/drakkan/${pkgname}#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  go build -i -ldflags "-s -w -X github.com/drakkan/sftpgo/utils.commit=`git describe --always --dirty` -X github.com/drakkan/sftpgo/utils.date=`date --utc +%FT%TZ`" -o sftpgo
}

package() {
  cd "${pkgname}"
  install -Dm755 sftpgo "$pkgdir/usr/bin/${pkgname}"
  install -Dm 644 init/${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 sftpgo.json -t "${pkgdir}/etc/${pkgname}"
  cp -r templates "${pkgdir}/etc/${pkgname}/"
  cp -r static "${pkgdir}/etc/${pkgname}/"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r sql "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm 644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
  install -Dm 755 scripts/sftpgo_api_cli.py "${pkgdir}"/usr/share/doc/${pkgname}/scripts/sftpgo_api_cli.py
  install -Dm 644 scripts/README.md "${pkgdir}"/usr/share/doc/${pkgname}/scripts/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
