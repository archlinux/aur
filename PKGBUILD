# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>

_pkgname=sawyer
pkgname=${_pkgname}-git
pkgver=v0.0.1.r0.g7d842d5
pkgrel=1
pkgdesc="Sawyer is a background changer"
url='https://github.com/txomon/sawyer/'
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('go' 'git')
conflicts=('sawyer-bin')
_gourl=github.com/txomon
source=(${pkgname}::"git+https://${_gourl}/${_pkgname}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/../$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${_pkgname}"
  mv -f "${pkgname}" "${srcdir}/src/${_gourl}/${_pkgname}"
  msg2 "Fetching dependencies"
  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  GOPATH="${srcdir}" ./go-get-deps.sh
}

build() {
  msg2 "Build program"
  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" go build -o sawyer.bin
}

package() {
  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  install -Dm755 sawyer.bin "${pkgdir}/usr/bin/sawyer"

  cd "${srcdir}/.."
  # Zsh completion
  install -Dm755 config.json $pkgdir/etc/sawyer/config.json
}