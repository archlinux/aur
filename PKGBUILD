# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo
pkgver=2.5.0
pkgrel=1
pkgdesc='Fully featured and highly configurable SFTP server with optional HTTP, FTP/S and WebDAV support. It can serve local filesystem, S3, GCS, Azure Blob, SFTP'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/drakkan/${pkgname}"
license=('AGPLv3')
depends=('libcap')
makedepends=('gcc' 'git' 'go' 'gzip')
optdepends=(
  "sqlite: to use SQLite provider"
  "postgresql: to use PostgreSQL provider"
  "mariadb: to use MySQL provider"
  "cockroachdb: to use CockroachDB provider"
)
backup=("etc/${pkgname}/sftpgo.json")
install=${pkgname}.install

source=("git+https://github.com/drakkan/${pkgname}#tag=v${pkgver}"
  "sftpgo.json"
  "sftpgo.sysusers")
sha256sums=('SKIP'
  '01b67418c2f8382ee664b7409122d987d6a193f7d235d441c50cdb6924c6fc2f'
  '44658210043f805057c2e4b473653637a91204e4da17954b08081292c72edcb8')

_uid_sftpgo=315
_gid_sftpgo=315

build() {
  cd "${pkgname}"
  go build -trimpath -tags nopgxregisterdefaulttypes -ldflags "-s -w -X github.com/drakkan/sftpgo/v2/internal/version.commit=`git describe --always --abbrev=8 --dirty` -X github.com/drakkan/sftpgo/v2/internal/version.date=`date --utc +%FT%TZ`" -o sftpgo
  ./sftpgo gen completion bash > sftpgo-completion.bash
  ./sftpgo gen man -d man1
  gzip man1/*
}

package() {
  cd "${pkgname}"
  install -Dm 755 sftpgo "$pkgdir/usr/bin/${pkgname}"
  install -Dm 644 init/${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/etc/${pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/etc/${pkgname}/env.d"
  install -Dm 640 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "$srcdir/sftpgo.json" -t "${pkgdir}/etc/${pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/var/lib/${pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/srv/${pkgname}"
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r templates "${pkgdir}/usr/share/${pkgname}/"
  cp -r static "${pkgdir}/usr/share/${pkgname}/"
  cp -r openapi "${pkgdir}/usr/share/${pkgname}/"
  install -Dm 644 "$srcdir/sftpgo.json" "${pkgdir}/usr/share/doc/${pkgname}/sftpgo.json.default"
  echo "For documentation please take a look here:" > "${pkgdir}"/usr/share/doc/${pkgname}/README
  echo "" >> "${pkgdir}"/usr/share/doc/${pkgname}/README
  echo "https://github.com/drakkan/sftpgo/blob/v${pkgver}/README.md" >> "${pkgdir}"/usr/share/doc/${pkgname}/README
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm 644 sftpgo-completion.bash "${pkgdir}/usr/share/bash-completion/completions/sftpgo"
  install -d "${pkgdir}/usr/share/man"
  cp -r man1 "${pkgdir}/usr/share/man/"
  install -Dm 644 "$srcdir/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
