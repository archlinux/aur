# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-daemon
pkgver=0.7
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-daemon'
license=('MIT')
makedepends=('go')
conflicts=('dovecot-xaps-daemon-git')
backup=('etc/xapsd/xapsd.conf')
source=(https://github.com/st3fan/dovecot-xaps-daemon/archive/v${pkgver}.tar.gz)
sha512sums=('0df0194844cfa7643cb37fad63990af21547318c4e7ff23a68f72c8f61a2147cacfcc4e4466fa7b9fdc1212b71800c24d5bf9c420e01fe043fd06e42d61f1fd1')

prepare() {
  mkdir -p src/github.com/st3fan/
  ln -s "${srcdir}"/${pkgname}-${pkgver} src/github.com/st3fan/${pkgname}
}

build() {
  cd src/github.com/st3fan/${pkgname}/
  GOPATH="${srcdir}" go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v .
}

package() {
  install -dm755 "${pkgdir}"/var/lib/xapsd/
  install -Dm755 src/github.com/st3fan/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/xapsd
  install -Dm644 -t "${pkgdir}"/etc/xapsd/ "${srcdir}"/${pkgname}-${pkgver}/etc/xapsd/xapsd.conf
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ "${srcdir}"/${pkgname}-${pkgver}/etc/systemd/xapsd.service
}
