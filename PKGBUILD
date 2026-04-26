# Maintainer: Omansh Krishn <omansh@duck.com>

_pkgname=gotohp
pkgname=${_pkgname}-git
pkgver=0.7.0.r1.g5c26b8c
pkgrel=1
pkgdesc='Unofficial Google Photos Desktop GUI Client - git version'
arch=('x86_64')
url='https://github.com/xob0t/gotohp'
license=('MIT')
makedepends=(
  git
  go
  nodejs
  npm
  pkgconf
)
depends=(
  webkit2gtk-4.1
  gtk3
)
provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=(!debug)

source=("${_pkgname}"::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    git -C "${srcdir}/${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}/go"
  export PATH="${GOPATH}/bin:${PATH}"
  go install github.com/wailsapp/wails/v3/cmd/wails3@latest
  # go build -tags production -trimpath -buildvcs=false -ldflags="-w -s" -o bin/gotohp
  wails3 task linux:build -- PRODUCTION=true
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -m644 "${srcdir}/${_pkgname}/build/appicon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  sed -i "s|^Exec=.*|Exec=${_pkgname}|" "${srcdir}/${_pkgname}/build/linux/desktop"
  install -Dm644 "${srcdir}/${_pkgname}/build/linux/desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
