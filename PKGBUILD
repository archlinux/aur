# Maintainer: Frederik Schwan <freswa at archlinux dot org>

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
source=("https://github.com/st3fan/dovecot-xaps-daemon/archive/v${pkgver}.tar.gz")
b2sums=('89082412c7e17b4d345898cf7a66b6125481f836df482de8cb77ea15c8f2ef8067dab2959c51d94ccd9248aecaba57700c9818a5947aa9490ba2e7ce8f09e80b')

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
