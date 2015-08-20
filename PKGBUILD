# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gopm-git
_pkgname=gopm
pkgver=20150820
pkgrel=1
epoch=1
pkgdesc="Go Package Manager"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
changelog=$_pkgname.changelog
url="https://github.com/gpmgo/gopm"
license=('MIT')
depends=()
optdepends=()
makedepends=('go>=1.2')
conflicts=('gopm')
options=('!strip' '!emptydirs')

_gourl=github.com/gpmgo
source=("${_pkgname}::git+https://${_gourl}/${_pkgname}.git")

sha512sums=('SKIP')

pkgver(){
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p "${srcdir}/${_gourl}"
  mv "${_pkgname}" "${srcdir}/${_gourl}/${_pkgname}"
  msg2 "go get"
  GOPATH="${srcdir}" go get -u "${_gourl}/${_pkgname}"
}

build() {
  msg2 "Build program"
  cd ${srcdir}/src/${_gourl}/${_pkgname}
  GOPATH="${srcdir}" go fix
  GOPATH="${srcdir}" go build
}

package() {
  install -D -m 0755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
