# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo-bin
_pkgname=sftpgo
pkgver=2.5.1
pkgrel=1
pkgdesc='Fully featured and highly configurable SFTP server with optional HTTP, FTP/S and WebDAV support. It can serve local filesystem, S3, GCS, Azure Blob, SFTP'
arch=('x86_64')
url="https://github.com/drakkan/${_pkgname}"
license=('AGPLv3')
depends=('libcap')
optdepends=(
  "sqlite: to use SQLite provider"
  "postgresql: to use PostgreSQL provider"
  "mariadb: to use MySQL provider"
  "cockroachdb: to use CockroachDB provider"
)
conflicts=('sftpgo')
provides=('sftpgo')
backup=(
  "etc/${_pkgname}/sftpgo.json"
  "var/lib/${_pkgname}/sftpgo.db"
)
install=${pkgname}.install

source=("https://github.com/drakkan/sftpgo/releases/download/v${pkgver}/sftpgo_v${pkgver}_linux_x86_64.tar.xz"
  "sftpgo.json"
  "sftpgo.sysusers")
sha256sums=('48d3f8e589a883cfed231fc06b7445a67e524ad6c7e8606f249af3cb7d8a722d'
  '01b67418c2f8382ee664b7409122d987d6a193f7d235d441c50cdb6924c6fc2f'
  '44658210043f805057c2e4b473653637a91204e4da17954b08081292c72edcb8')

_uid_sftpgo=315
_gid_sftpgo=315

package() {
  install -Dm 755 sftpgo "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 644 init/${_pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/etc/${_pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/etc/${_pkgname}/env.d"
  install -Dm 640 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "$srcdir/sftpgo.json" -t "${pkgdir}/etc/${_pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/var/lib/${_pkgname}"
  install -Dm 600 -o ${_uid_sftpgo} -g ${_gid_sftpgo} sqlite/sftpgo.db -t "${pkgdir}/var/lib/${_pkgname}"
  install -dm750 -o ${_uid_sftpgo} -g ${_gid_sftpgo} "${pkgdir}/srv/${_pkgname}"
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r templates "${pkgdir}/usr/share/${_pkgname}/"
  cp -r static "${pkgdir}/usr/share/${_pkgname}/"
  cp -r openapi "${pkgdir}/usr/share/${_pkgname}/"
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 "$srcdir/sftpgo.json" "${pkgdir}/usr/share/doc/${_pkgname}/sftpgo.json.default"
  install -Dm 644 README.txt "${pkgdir}"/usr/share/doc/${_pkgname}/README
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm 644 bash_completion/sftpgo "${pkgdir}/usr/share/bash-completion/completions/sftpgo"
  install -d "${pkgdir}/usr/share/man"
  cp -r man/man1 "${pkgdir}/usr/share/man/"
  install -Dm 644 "$srcdir/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
