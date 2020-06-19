# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo-git
_pkgname=sftpgo
pkgver=r378.23a80b0
pkgrel=1
pkgdesc='Full featured and highly configurable SFTP server'
arch=('i686' 'x86_64')
url="https://github.com/drakkan/${_pkgname}"
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
conflicts=('sftpgo')
provides=('sftpgo')
backup=("etc/${_pkgname}/sftpgo.json")
install=${pkgname}.install

source=("git+https://github.com/drakkan/${_pkgname}.git"
  "sftpgo.json"
  "README")
sha256sums=('SKIP'
  'd4bc2ddb3104e2e1be40103e7653f2d7802658576ba8e80bebfad7901a8b46a4'
  '9c6c5a49b4605fe83beb895c5f31b1f85afb317fc1d16c875a9ae5af23313d23')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  go build -i -ldflags "-s -w -X github.com/drakkan/sftpgo/version.commit=`git describe --always --dirty` -X github.com/drakkan/sftpgo/version.date=`date --utc +%FT%TZ`" -o sftpgo
}

package() {
  cd "${_pkgname}"
  install -Dm 755 sftpgo "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 755 examples/rest-api-cli/sftpgo_api_cli.py "${pkgdir}"/usr/bin/sftpgo_api_cli
  install -Dm 644 init/${_pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/sftpgo.json" -t "${pkgdir}/etc/${_pkgname}"
  install -d "${pkgdir}/var/lib/${_pkgname}"
  cp -r templates "${pkgdir}/var/lib/${_pkgname}/"
  cp -r static "${pkgdir}/var/lib/${_pkgname}/"
  install -Dm 644 "$srcdir/README" "${pkgdir}"/usr/share/doc/${_pkgname}/README
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
