# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=advanced-ssh-config
_name=assh
pkgver=2.11.3
_vcsref=281772c
pkgrel=2
pkgdesc='ssh wrapper using ProxyCommand that adds regex, aliases, gateways, includes, dynamic hostnames to SSH and ssh-config'
arch=('x86_64')
url='https://github.com/moul/assh'
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=('assh-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moul/assh/archive/v${pkgver}.tar.gz")
sha256sums=('da95db33f72ad2531124b0de42074ba61ac1eebdad90bac90c68d1b02aa51354')

build() {
  cd "$_name-$pkgver"
  go build \
     -trimpath \
     -buildmode=pie \
     -modcacherw \
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
  install -Dm755 contrib/completion/zsh_autocomplete "${pkgdir}/usr/share/zsh/site-functions/_assh"
  install -Dm755 contrib/completion/bash_autocomplete "${pkgdir}/usr/share/bash-completion/completions/assh"
  for _dir_name in examples/*
  do
    install -Dm755 -t "${pkgdir}/usr/share/doc/advanced-ssh-config/$_dir_name" $_dir_name/*
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
