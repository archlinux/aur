# Maintainer: Daniel Kamil Kozar <dkk089@gmail.com>

_pkgname=czateria
pkgname=czateria-git
pkgver=r38.b4d96a9
pkgrel=1
pkgdesc="Qt client for Czateria, a Polish chatroom network"
arch=(x86_64)
url="https://github.com/xavery/czateria"
license=('BSD')
depends=(qt5-websockets)
makedepends=(git gendesk)
provides=(${_pkgname})
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  mkdir build
  cd build
  qmake ../czateria.pro CONFIG+=release QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}"
  make
}

package() {
  gendesk -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" \
    --categories "Network;Chat" --name "Czateria"
  install -Dm644 "${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}/ui/icons/czateria.png" \
    "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${_pkgname}/LICENCE.BSD" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${_pkgname}/build/ui/ui" "$pkgdir/usr/bin/${_pkgname}"
}
