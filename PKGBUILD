# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap-git
pkgver=2.1.849.b63c20b
pkgrel=1
pkgdesc='Swiss army knife for network attacks and monitoring'
url='https://github.com/bettercap/bettercap'
arch=('x86_64')
license=('GPL3')
depends=('libpcap')
makedepends=('go-pie' 'git')
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
  export GOPATH="${srcdir}"
  mkdir -p src/github.com/bettercap
  ln -rTsf ${pkgname} src/github.com/bettercap/bettercap
}

build() {
  cd src/github.com/bettercap/bettercap
  export GOPATH="${srcdir}"
  go get -v
  go build -o bettercap
}

package() {
  cd ${pkgname}
  install -Dm 755 ../bin/bettercap -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
