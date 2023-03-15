# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo-git
_pkgname=sftpgo
pkgver=r1460.783dff36
pkgrel=1
pkgdesc='Fully featured and highly configurable SFTP server with optional HTTP, FTP/S and WebDAV support. It can serve local filesystem, S3, GCS, Azure Blob, SFTP'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/drakkan/${_pkgname}"
license=('AGPLv3')
depends=('libcap')
makedepends=('gcc' 'git' 'go' 'gzip')
optdepends=(
  "sqlite: to use SQLite provider"
  "postgresql: to use PostgreSQL provider"
  "mariadb: to use MySQL provider"
  "cockroachdb: to use CockroachDB provider"
)
conflicts=('sftpgo')
provides=('sftpgo')
backup=("etc/${_pkgname}/sftpgo.json")
install=${pkgname}.install

source=("git+https://github.com/drakkan/${_pkgname}.git"
  "sftpgo.json"
  "sftpgo.sysusers")
sha256sums=('SKIP'
  '01b67418c2f8382ee664b7409122d987d6a193f7d235d441c50cdb6924c6fc2f'
  '44658210043f805057c2e4b473653637a91204e4da17954b08081292c72edcb8')

_uid_sftpgo=315
_gid_sftpgo=315

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  go build -trimpath -tags nopgxregisterdefaulttypes -ldflags "-s -w -X github.com/drakkan/sftpgo/v2/internal/version.commit=`git describe --always --abbrev=8 --dirty` -X github.com/drakkan/sftpgo/v2/internal/version.date=`date --utc +%FT%TZ`" -o sftpgo
  ./sftpgo gen completion bash > sftpgo-completion.bash
  ./sftpgo gen man -d man1
  gzip man1/*
}

package() {
  cd "${_pkgname}"
  install -Dm 755 sftpgo "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 644 init/${_pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/etc/${_pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/etc/${_pkgname}/env.d"
  install -Dm 640 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "$srcdir/sftpgo.json" -t "${pkgdir}/etc/${_pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/var/lib/${_pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/srv/${_pkgname}"
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r templates "${pkgdir}/usr/share/${_pkgname}/"
  cp -r static "${pkgdir}/usr/share/${_pkgname}/"
  cp -r openapi "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm 644 "$srcdir/sftpgo.json" "${pkgdir}/usr/share/doc/${_pkgname}/sftpgo.json.default"
  echo "" >> "${pkgdir}"/usr/share/doc/${_pkgname}/README
  echo "https://github.com/drakkan/sftpgo/blob/main/README.md" >> "${pkgdir}"/usr/share/doc/${_pkgname}/README
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm 644 sftpgo-completion.bash "${pkgdir}/usr/share/bash-completion/completions/sftpgo"
  install -d "${pkgdir}/usr/share/man"
  cp -r man1 "${pkgdir}/usr/share/man/"
  install -Dm 644 "$srcdir/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
