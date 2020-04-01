# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=advanced-ssh-config
_name=assh
pkgver=2.9.1
pkgrel=1
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64')
url='https://github.com/moul/assh'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moul/assh/archive/v${pkgver}.tar.gz"
        'version.patch')
sha256sums=('fed8876c574061c239a1d159d9c7197e8bda94f6610f6e29e682d8b6dde60852'
            'cf4ceca28b7d7dbeae51b214e23d9f05e2149a17438b97c9407e7b57107d2f7b')

export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-trimpath"

prepare() {
  cd "$_name-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/version.patch"
}

build(){
  cd "$_name-$pkgver"
  go build \
     -trimpath \
     -ldflags "-extldflags ${LDFLAGS}" \
     -o assh \
     .
}

check() {
  cd "$_name-$pkgver"
  go test ./...
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 assh "${pkgdir}/usr/bin/assh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:


