# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>
_pkgname=elixir-ls
pkgname=elixir-ls-git
pkgver=0.3.0.r12.g5c0166c
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
arch=('any')
url='https://github.com/elixir-lsp/elixir-ls'
depends=('elixir>=1.7.0' 'erlang-nox>=20.0')
source=("${_pkgname}::git://github.com/elixir-lsp/elixir-ls.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  export MIX_ENV=prod
  mix deps.get
  mix compile
}

package() {
  cd "${_pkgname}"

  install -dm0644 "${pkgdir}"/usr/lib/elixir-ls
  MIX_ENV=prod mix elixir_ls.release -o "${pkgdir}"/usr/lib/elixir-ls

  install -dm0755 "${pkgdir}"/usr/bin
  ln -sf /usr/lib/elixir-ls/language_server.sh "${pkgdir}"/usr/bin/elixir-ls
  ln -sf /usr/lib/elixir-ls/debugger.sh "${pkgdir}"/usr/bin/elixir-ls-debugger
}
