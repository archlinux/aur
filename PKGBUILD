# Maintainer: A Frederick Christensen <aur@ivories.org>

pkgname=mautrix-syncproxy-git
_pkgname=mautrix-syncproxy
pkgver=0
pkgrel=2
pkgdesc="A proxy microservice for Matrix designed to be used with mautrix-wsproxy"
arch=('x86_64')
license=('AGPL')
makedepends=('go' 'git')
url="https://github.com/mautrix/syncproxy"
source=(${_pkgname}::git+https://github.com/fauxmight/syncproxy.git#branch=config_file
	${_pkgname}.service)
sha256sums=('SKIP'
	    '518f0862ddd9b6a9f7d5c1ead047e99511845b524ac83792eac63e14c3ef9bc5')

# https://wiki.archlinux.org/title/VCS_package_guidelines :
# "If there are no tags then use number of revisions since beginning of the history"
pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  go build -o ${_pkgname}
}

package() {
  install -d ${pkgdir}/{etc/$_pkgname,usr/lib/systemd/system}
  install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 ${srcdir}/${_pkgname}/example-config.yaml ${pkgdir}/etc/${_pkgname}/example-config.yaml
  install -Dm644 ${srcdir}/${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service
  install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}

# vim:set ts=2 sw=2 et:
