# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-daemon
pkgver=0.8
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('x86_64')
url='https://github.com/st3fan/dovecot-xaps-daemon'
license=('custom:MIT')
makedepends=('go')
backup=('etc/xapsd/xapsd.conf')
source=("https://github.com/st3fan/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('89bd2b97e469c6cff58c4e68e86ccb573f748a4c17f415969f853f55eab620bf9f1d9b8902e5853f2f0eb9f0c17bcfc9f44fce45e7c83e5e75342de878f99387')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build .
}

package() {
  install -dm755 "${pkgdir}"/var/lib/xapsd/
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname} "${pkgdir}"/usr/bin/xapsd
  install -Dm644 -t "${pkgdir}"/etc/xapsd/ "${srcdir}"/${pkgname}-${pkgver}/etc/xapsd/xapsd.conf
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ "${srcdir}"/${pkgname}-${pkgver}/etc/systemd/xapsd.service
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/${pkgname}-${pkgver}/LICENSE
}
