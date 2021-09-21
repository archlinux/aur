# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-daemon
pkgver=1.1
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('x86_64')
url='https://github.com/freswa/dovecot-xaps-daemon'
license=('custom:MIT')
makedepends=('go')
backup=('etc/xapsd/xapsd.yaml')
source=("https://github.com/freswa/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('4938e41efd8b23d73e53e10d4e7bb50b79c92aa7e81a2e4c7ab08b48e47c495092c1760e9700b3b01d782f55d5da92292203f02cdae921ec7bcb1e0917bc9972')

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
