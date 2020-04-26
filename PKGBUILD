# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-daemon-git
_gitname=dovecot-xaps-daemon
pkgver=94.b098747
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-daemon'
license=('MIT')
makedepends=('git' 'go')
provides=('dovecot-xaps-daemon')
conflicts=('dovecot-xaps-daemon')
backup=('etc/xapsd/xapsd.conf')
source=('git+https://github.com/st3fan/dovecot-xaps-daemon.git')
b2sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd ${_gitname}
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v .
  }

package() {
  install -dm755 "${pkgdir}"/var/lib/xapsd/
  install -Dm755 "${srcdir}"/${_gitname}/${_gitname} "${pkgdir}"/usr/bin/xapsd
  install -Dm644 -t "${pkgdir}"/etc/xapsd/ "${srcdir}"/${_gitname}/etc/xapsd/xapsd.conf
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ "${srcdir}"/${_gitname}/etc/systemd/xapsd.service
}
