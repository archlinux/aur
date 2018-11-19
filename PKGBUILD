# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap-git
pkgver=2.11.1313.8cf3e65
pkgrel=1
pkgdesc='Swiss army knife for network attacks and monitoring'
url='https://github.com/bettercap/bettercap'
arch=('x86_64')
license=('GPL3')
depends=('libpcap' 'libnetfilter_queue' 'iproute2' 'glibc' 'libnfnetlink')
makedepends=('go-pie' 'git' 'dep')
provides=('bettercap')
conflicts=('bettercap')
source=(${pkgname}::git+https://github.com/bettercap/bettercap)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  export GOPATH="${srcdir}/go"
  mkdir -p go/src/github.com/bettercap
  ln -rTsf ${pkgname} go/src/github.com/bettercap/bettercap
  sed -E "s|(go build)|\\1 -ldflags -linkmode external -extldflags \"${LDFLAGS}\"|" -i ${pkgname}/Makefile
}

build() {
  cd go/src/github.com/bettercap/bettercap
  export GOPATH="${srcdir}/go"
  dep ensure
  go build -o bettercap
}

package() {
  cd ${pkgname}
  install -Dm 755 bettercap -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
