# Maintainer: Denis Proskurin <dpvpro AT gmail DOT com>

pkgname=amc
pkgver=2026.08.13
pkgrel=1
pkgdesc='Retrieve and filter the latest Pacman mirror list. Reimplementation of Reflector on Golang.'
arch=('x86_64')
url="https://github.com/dpvpro/amc"
license=('MIT')
depends=('glibc')
conflicts=('reflector' 'reflector-rs')
makedepends=('go' 'git')
optdepends=('rsync: rate rsync mirrors')
backup=('etc/xdg/amc/amc.conf')
source=("git+https://github.com/dpvpro/amc")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --format="%cd" --date=format:%Y.%m.%d
}

build() {
  cd "${srcdir}/${pkgname}"
  go build \
    -trimpath \
    -buildvcs=false \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    -buildmode=pie \
    -o amc .
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 amc "${pkgdir}/usr/bin/amc"
  install -Dm644 configs/amc.conf "${pkgdir}/etc/xdg/amc/amc.conf"
  install -Dm644 configs/amc.service "${pkgdir}/usr/lib/systemd/system/amc.service"
  install -Dm644 configs/amc.timer "${pkgdir}/usr/lib/systemd/system/amc.timer"
}

# vim: set ts=2 sw=2 et:
