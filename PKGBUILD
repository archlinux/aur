# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-daemon
pkgver=0.9
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('x86_64')
url='https://github.com/freswa/dovecot-xaps-daemon'
license=('custom:MIT')
makedepends=('go')
backup=('etc/xapsd/xapsd.yaml')
source=("https://github.com/freswa/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('7c135e0f8981627e5f17d8f919323024eab68e119b5fca56e38c65071c853a1563462b63512475b2d0ab424bb79bc79ab3ed2174fdbbda92c8154db1dab59b39')

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
  install -Dm644 -t "${pkgdir}"/etc/xapsd/ "${srcdir}"/${pkgname}-${pkgver}/etc/xapsd/xapsd.yaml
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ "${srcdir}"/${pkgname}-${pkgver}/etc/systemd/xapsd.service
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/${pkgname}-${pkgver}/LICENSE
}
