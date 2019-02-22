# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=advanced-ssh-config
_name=assh
pkgver=2.8.0
pkgrel=2
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64')
url='https://github.com/moul/assh'
license=('MIT')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moul/assh/archive/v${pkgver}.tar.gz")
sha256sums=('17656a6ac562707d6e85df44c1ccd04276fb1c08f1ff6a002291f4cb88880069')
_gourl=github.com/moul/advanced-ssh-config

prepare() {
  mkdir -p "gopath/src/github.com/moul/"
  ln -rTsf "${_name}-${pkgver}" "gopath/src/${_gourl}"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "gopath/src/${_gourl}"

  go install \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" \
    ./...
}

check() {
  export GOPATH="$srcdir"/gopath
  cd "gopath/src/${_gourl}"
  go test ./...
}

package() {
  install -Dm755 gopath/bin/assh "${pkgdir}/usr/bin/assh"
  install -Dm644 "${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:


