# Maintainer: A Frederick Christensen <aur@ivories.org>

pkgname=mautrix-wsproxy-git
_pkgname=mautrix-wsproxy
pkgver=0
pkgrel=6
pkgdesc="A websocket proxy for Matrix appservices - latest git commit"
arch=('x86_64')
license=('AGPL')
makedepends=('go' 'git')
replaces=('mautrix-wsproxy')
url="https://github.com/mautrix/wsproxy"
source=(${_pkgname}::git+https://github.com/mautrix/wsproxy.git
        ${_pkgname}.service)
sha256sums=('SKIP'
	    '72fd829b7ec5ceea3f8b7b20139c71bec00081c4a34fc1a16c0ca86e269d19aa')
install=${_pkgname}.install

# https://wiki.archlinux.org/title/VCS_package_guidelines :
# "If there are no tags then use number of revisions since beginning of the history"
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  go build -o "${_pkgname}"
}

package() {
  install -d ${pkgdir}{/etc/mautrix-wsproxy,/usr/lib/systemd/system}
  install -Dm640 ${srcdir}/${_pkgname}/example-config.yaml ${pkgdir}/etc/mautrix-wsproxy/${_pkgname}-example-config.yaml
  install -Dm644 ${srcdir}/${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service
  install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}

# vim:set ts=2 sw=2 et:
