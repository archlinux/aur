# Maintainer: A Frederick Christensen <aur@ivories.org>

pkgname=mautrix-wsproxy-git
_pkgname=mautrix-wsproxy
pkgver=0
pkgrel=1
pkgdesc="A websocket proxy for Matrix appservices - latest git commit"
arch=('x86_64')
license=('AGPL')
makedepends=('go' 'git')
provides=('mautrix-wsproxy')
conflicts=('mautrix-wsproxy')
url="https://github.com/mautrix/wsproxy"
source=(${_pkgname}::git+https://github.com/mautrix/wsproxy.git
        ${_pkgname}@.system_service)
sha256sums=('SKIP'
	    '69a295316f3ba6da47cdb97640c3a950c54c382629a92ce5e542d6d43a47c1d6')
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
  install ${srcdir}/${_pkgname}/example-config.yaml ${pkgdir}/etc/mautrix-wsproxy/${_pkgname}-example-config.yaml
  install ${srcdir}/${_pkgname}@.system_service ${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service
  install -Dm755 ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}

# vim:set ts=2 sw=2 et:
