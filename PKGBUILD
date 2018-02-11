# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=dovecot-xaps-daemon-git
_gitname=dovecot-xaps-daemon
pkgver=81.c955ea6
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('any')
url='https://github.com/st3fan/dovecot-xaps-daemon'
license=('MIT')
makedepends=('git')
provides=('dovecot-xaps-daemon')
conflicts=('dovecot-xaps-daemon')
backup=('etc/xapsd/xapsd.conf')
source=(git+https://github.com/st3fan/dovecot-xaps-daemon.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  mkdir -p "${srcdir}/src/github.com/st3fan/"
  ln -s "${srcdir}/${_gitname}" "${srcdir}/src/github.com/st3fan/${_gitname}"
}

build() {
  cd "${srcdir}/src/github.com/st3fan/${_gitname}/"
  GOPATH="${srcdir}" go build .
}

package() {
  install -dm755 "${pkgdir}/var/lib/xapsd/"
  install -Dm755 "${srcdir}/src/github.com/st3fan/${_gitname}/${_gitname}" "${pkgdir}/usr/bin/xapsd"
  install -Dm644 -t "${pkgdir}/etc/xapsd/" "${srcdir}/${_gitname}/etc/xapsd/xapsd.conf"
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${_gitname}/etc/systemd/xapsd.service"
}
