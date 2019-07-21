# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=sftpgo-git
_pkgname=sftpgo
pkgver=r11.5f41b6d
pkgrel=1
pkgdesc='Full featured and highly configurable SFTP server software'
arch=('i686' 'x86_64')
url="https://github.com/giltene/${_pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
optdepends=(
  "sqlite: to use SQLite provider"
  "postgresql: to use PostgreSQL provider"
  "mariadb: to use MySQL provider"
)
backup=("etc/${_pkgname}/sftpgo.conf")
install=${pkgname}.install

source=("git+https://github.com/drakkan/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  go build -i -ldflags "-s -w" -o sftpgo 	 
}

package() {
  cd "${_pkgname}"
  install -Dm755 sftpgo "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 644 init/${_pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 sftpgo.conf -t "${pkgdir}/etc/${_pkgname}"
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -r sql "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
