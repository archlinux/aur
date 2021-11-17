# Maintainer: Donald Carr <sirspudd _at_ gmail.com>

_pkgname=goplay2
pkgname=${_pkgname}-git
pkgver=r63.4c938e0
pkgrel=1
pkgdesc='goplay2 airplay2 server'
arch=(x86_64)
url='https://github.com/openairplay/goplay2'
license=(Apache)
depends=(libfdk-aac)
makedepends=(go git)
source=("git+$url")
sha256sums=('SKIP')
install=goplay2.install

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  go build -o goplay2 .
}

package() {
  local bin_dir="${pkgdir}/usr/bin"
  local service_dir="${pkgdir}/usr/lib/systemd/user"

  install -Dm755 goplay2/goplay2 ${bin_dir}/goplay2
  install -Dm644 ${startdir}/goplay2.service ${service_dir}/goplay2.service
  install -Dm644 ${startdir}/goplay2-default-network-interface ${pkgdir}/etc/goplay2-default-network-interface
}
