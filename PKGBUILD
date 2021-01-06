# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=advanced-ssh-config
_name=assh
pkgver=2.11.0
_vcsref=3b5e2fe
pkgrel=1
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64')
url='https://github.com/moul/assh'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moul/assh/archive/v${pkgver}.tar.gz")
sha256sums=('8819b847cabddbd1a36893dfeadbbf60346bed14d38e36726248817ff101489c')

build() {
  cd "$_name-$pkgver"
  go build \
     -trimpath \
     -buildmode=pie \
     -modcacherw \
     -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
     -ldflags "-X 'moul.io/assh/v2/pkg/version.Version=${pkgver}' -X 'moul.io/assh/v2/pkg/version.VcsRef=${_vcsref}'" \
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
