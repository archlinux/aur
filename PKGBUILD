# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo-git
_pkgname=sftpgo
pkgver=r419.22338ed
pkgrel=1
pkgdesc='Fully featured and highly configurable SFTP server'
arch=('i686' 'x86_64')
url="https://github.com/drakkan/${_pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'git' 'go' 'gzip')
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
  "sftpgo.json")
sha256sums=('SKIP'
  '999544d837a84716e9978a90c6ca923df58746b7bc7cf2a83dc00f2230aa8c5b')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  go build -ldflags "-s -w -X github.com/drakkan/sftpgo/version.commit=`git describe --always --dirty` -X github.com/drakkan/sftpgo/version.date=`date --utc +%FT%TZ`" -o sftpgo
  ./sftpgo gen completion bash > sftpgo-completion.bash
  ./sftpgo gen man -d man1
  gzip man1/*
}

package() {
  cd "${_pkgname}"
  install -Dm 755 sftpgo "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 755 examples/rest-api-cli/sftpgo_api_cli.py "${pkgdir}"/usr/bin/sftpgo_api_cli
  install -Dm 644 init/${_pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/sftpgo.json" -t "${pkgdir}/etc/${_pkgname}"
  install -d "${pkgdir}/var/lib/${_pkgname}"
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r templates "${pkgdir}/usr/share/${_pkgname}/"
  cp -r static "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm 644 "$srcdir/sftpgo.json" "${pkgdir}/usr/share/doc/${_pkgname}/sftpgo.json.default"
  echo "" >> "${pkgdir}"/usr/share/doc/${_pkgname}/README
  echo "https://github.com/drakkan/sftpgo/blob/master/README.md" >> "${pkgdir}"/usr/share/doc/${_pkgname}/README
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
  install -d "${pkgdir}/etc/bash_completion.d"
  install -Dm 644 sftpgo-completion.bash "${pkgdir}/etc/bash_completion.d/"
  install -d "${pkgdir}/usr/share/man"
  cp -r man1 "${pkgdir}/usr/share/man/"
}

# vim:set ts=2 sw=2 et:
