# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=mop-git
pkgver=v0.2.0.r80.g4f48191
pkgrel=1
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mop-tracker/mop'
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
_gourl="github.com/mop-tracker/mop"

prepare() {
  GOPATH="${srcdir}" go get -fix -v -x ${_gourl}
}

pkgver() {
  cd "${srcdir}/src/${_gourl}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  GOPATH="${srcdir}" go install -v -gcflags "all=-trimpath=${srcdir}" \
    -asmflags "all=-trimpath=${srcdir}" -x ${_gourl}/cmd/mop
}

package() {
  # binary
  install -D -m755 "${srcdir}/bin/mop" "${pkgdir}/usr/bin/mop"

  # docs
  install -D -m644 "${srcdir}/src/${_gourl}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
