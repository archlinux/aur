# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-daemon-git
_gitname=dovecot-xaps-daemon
pkgver=0.9.r30.gb8bd75f
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - xaps daemon'
arch=('x86_64')
url='https://github.com/freswa/dovecot-xaps-daemon'
license=('custom:MIT')
makedepends=('git' 'go')
provides=('dovecot-xaps-daemon')
conflicts=('dovecot-xaps-daemon')
backup=('etc/xapsd/xapsd.yaml')
source=('git+https://github.com/freswa/dovecot-xaps-daemon.git')
b2sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd ${_gitname}
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/xapsd
  }

package() {
  install -dm755 "${pkgdir}"/var/lib/xapsd/
  install -Dm755 "${srcdir}"/${_gitname}/xapsd "${pkgdir}"/usr/bin/xapsd
  install -Dm644 -t "${pkgdir}"/etc/xapsd/ "${srcdir}"/${_gitname}/configs/xapsd/xapsd.yaml
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ "${srcdir}"/${_gitname}/configs/systemd/xapsd.service
  install -Dm644 "${srcdir}"/${_gitname}/configs/systemd/xapsd.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/xapsd.conf
  install -Dm644 "${srcdir}"/${_gitname}/configs/systemd/xapsd-sysusers.conf "${pkgdir}"//usr/lib/sysusers.d/xapsd.conf
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/${_gitname}/LICENSE
}
