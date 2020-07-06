# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo
pkgver=1.0.0
pkgrel=1
pkgdesc='Fully featured and highly configurable SFTP server'
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

source=("git+https://github.com/drakkan/${pkgname}#tag=v${pkgver}"
  "sftpgo.json")
sha256sums=('SKIP'
  'd4bc2ddb3104e2e1be40103e7653f2d7802658576ba8e80bebfad7901a8b46a4')

build() {
  cd "${pkgname}"
  go build -i -ldflags "-s -w -X github.com/drakkan/sftpgo/version.commit=`git describe --always --dirty` -X github.com/drakkan/sftpgo/version.date=`date --utc +%FT%TZ`" -o sftpgo
}

package() {
  cd "${pkgname}"
  install -Dm 755 sftpgo "$pkgdir/usr/bin/${pkgname}"
  install -Dm 755 examples/rest-api-cli/sftpgo_api_cli.py "${pkgdir}"/usr/bin/sftpgo_api_cli
  install -Dm 644 init/${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/sftpgo.json" -t "${pkgdir}/etc/${pkgname}"
  install -d "${pkgdir}/var/lib/${pkgname}"
  cp -r templates "${pkgdir}/var/lib/${pkgname}/"
  cp -r static "${pkgdir}/var/lib/${pkgname}/"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  echo "For documentation please take a look here:" > "${pkgdir}"/usr/share/doc/${pkgname}/README
  echo "" >> "${pkgdir}"/usr/share/doc/${pkgname}/README
  echo "https://github.com/drakkan/sftpgo/blob/v${pkgver}/README.md" >> "${pkgdir}"/usr/share/doc/${pkgname}/README
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
