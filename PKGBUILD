# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2181,SC2148,SC2034,SC2164,SC2154

_gitname=firefox-socket-control
_version=1.5
pkgname=${_gitname}-git
pkgver=${_version}.13acc8b
pkgrel=1
pkgdesc="Control Firefox from a UNIX socket."
arch=('any')
url="https://github.com/karabaja4/${_gitname}"
license=('MIT')
install=${pkgname}.install
depends=('firefox' 'openbsd-netcat')
makedepends=('git' 'go')
source=("https://addons.mozilla.org/firefox/downloads/file/3933677/socketcontrol-${_version}-fx.xpi"
        "git+${url}.git")
noextract=("socketcontrol-${_version}-fx.xpi")
sha256sums=('37f8cbd5cf3b9250ba2eede0b44e5aef6312c0e54c6e2eb173c3939be4fffddd'
            'SKIP')

pkgver() {
  cd "${_gitname}"
  echo "${_version}.$(git rev-parse --short HEAD)"
}

build() {
  go build -trimpath -o "${_gitname}/app/socketcontrol" "${_gitname}/app/socketcontrol.go"
}

package() {
  install -Dm644 "socketcontrol-${_version}-fx.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/native_control@karabaja4.xpi"

  cd "${_gitname}"
  install -Dm755 "firefox-socket" "${pkgdir}/usr/bin/firefox-socket"
  install -Dm755 "app/socketcontrol" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/socketcontrol"
  install -Dm644 "app/socketcontrol.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/socketcontrol.json"
}
