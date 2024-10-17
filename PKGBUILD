# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-daemon
pkgver=1.3
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('x86_64')
url='https://github.com/freswa/dovecot-xaps-daemon'
license=('custom:MIT')
makedepends=('go')
backup=('etc/xapsd/xapsd.yaml')
source=("https://github.com/freswa/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('761824221f80922b006c638ee5c34cf74c232af93deb27a06a5772e0291af3f0cf0b48d04c7e4917cb8cc831607d177c6642536144cde8447f17cdcd69ed16c9')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/xapsd
}

package() {
  install -dm755 "${pkgdir}"/var/lib/xapsd/
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/xapsd "${pkgdir}"/usr/bin/xapsd
  install -Dm644 -t "${pkgdir}"/etc/xapsd/ "${srcdir}"/${pkgname}-${pkgver}/configs/xapsd/xapsd.yaml
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ "${srcdir}"/${pkgname}-${pkgver}/configs/systemd/xapsd.service
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/configs/systemd/xapsd.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/xapsd.conf
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/configs/systemd/xapsd-sysusers.conf "${pkgdir}"//usr/lib/sysusers.d/xapsd.conf
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/${pkgname}-${pkgver}/LICENSE
}
