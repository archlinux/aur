# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>
# Contributor: Coelacanthus <coelacanthus@outlook.com>

pkgname=advanced-ssh-config
_name=assh
pkgver=2.17.3
_vcsref=071ef8e
pkgrel=1
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64')
url='https://github.com/moul/assh'
license=('MIT')
depends=('glibc' 'openssh')
makedepends=('go')
optdepends=(
  'bash-completion: for shell auto-completion'
  'openbsd-netcat: for gateway proxycommand support (nc)'
  'socat: alternative proxycommand helper'
  'graphviz: render dot output'
)
conflicts=('assh' 'assh-bin' 'assh-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moul/assh/archive/v${pkgver}.tar.gz")
sha256sums=('531cb10be20c86f464637428cc216525bb33e4651dc8aa801c09034521497172')

prepare() {
  cd "$_name-$pkgver"
  export GOPATH="${srcdir}/gopath"
  export GOTOOLCHAIN=local
  go mod download -modcacherw
}

build() {
  export GOPATH="${srcdir}/gopath"
  export GOTOOLCHAIN=local
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$_name-$pkgver"
  go build \
    -trimpath \
    -buildvcs=false \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
      -X 'moul.io/assh/v2/pkg/version.Version=${pkgver}' \
      -X 'moul.io/assh/v2/pkg/version.VcsRef=${_vcsref}'" \
    -o assh \
    .
}

check() {
  export GOPATH="${srcdir}/gopath"
  export GOTOOLCHAIN=local
  cd "$_name-$pkgver"
  go test -buildvcs=false -mod=readonly -modcacherw ./...
}

package() {
  cd "$_name-$pkgver"

  install -Dm755 assh "$pkgdir/usr/bin/assh"

  # completions
  install -Dm644 contrib/completion/zsh_autocomplete "$pkgdir/usr/share/zsh/site-functions/_assh"
  install -Dm644 contrib/completion/bash_autocomplete "$pkgdir/usr/share/bash-completion/completions/assh"

  # examples
  for _dir in examples/*; do
    [[ -d "$_dir" ]] || continue
    install -d "$pkgdir/usr/share/doc/$pkgname/$(basename "$_dir")"
    install -m644 "$_dir"/* "$pkgdir/usr/share/doc/$pkgname/$(basename "$_dir")/"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
