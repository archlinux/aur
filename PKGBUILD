# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>
# Contributor: Coelacanthus <coelacanthus@outlook.com>

pkgname=advanced-ssh-config
_name=assh
pkgver=2.16.0
_vcsref=869f978
pkgrel=1
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64')
url='https://github.com/moul/assh'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
  'bash-completion: for shell auto-completion'
  'zsh-completions: for shell auto-completion'
)
conflicts=('assh-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moul/assh/archive/v${pkgver}.tar.gz")
sha256sums=('9635d4123d344779728299627be57ee7ca26aa3ca65ed2fd4510a4fdd508b3cf')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  cd "$_name-$pkgver"
  go build \
     -trimpath \
     -buildmode=pie \
     -modcacherw \
     -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X 'moul.io/assh/v2/pkg/version.Version=${pkgver}' -X 'moul.io/assh/v2/pkg/version.VcsRef=${_vcsref}'" \
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
  install -Dm755 contrib/completion/zsh_autocomplete "${pkgdir}/usr/share/zsh/site-functions/_assh"
  install -Dm755 contrib/completion/bash_autocomplete "${pkgdir}/usr/share/bash-completion/completions/assh"
  for _dir_name in examples/*
  do
    install -Dm755 -t "${pkgdir}/usr/share/doc/advanced-ssh-config/$_dir_name" "${_dir_name}/"*
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
