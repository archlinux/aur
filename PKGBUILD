# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.7.0
pkgrel=2
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git' 'rebar3')
source=("elixir-ls-${pkgver}.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v${pkgver}.tar.gz")
cksums=('3485920754')
sha256sums=('f02cc980e0ed706eb7a4361b86560d2dcbfa103b7df662779527b6a8de64568e')
b2sums=('9837a0f9882ea326c398280dd586e47a46023a80ca15b58eebd704830076ce6b1f224b4284f44d3284c7d657b796d6f9da5eaf8c55416e8f6fb43f68e589b07a')

build() {
  cd "${pkgname}-${pkgver}"

  export MIX_ENV=prod
  export MIX_HOME="${srcdir}/mix-cache"

  # Fetch hex+rebar for deps.get to work
  mix local.hex --force
  mix local.rebar --force rebar3 /usr/bin/rebar3

  mix deps.get
  mix compile
}

package() {
  cd "${pkgname}-${pkgver}"

  export MIX_ENV=prod

  install -dm0755 "${pkgdir}"/usr/lib/${pkgname}
  mix elixir_ls.release -o "${pkgdir}"/usr/lib/${pkgname}

  install -dm0755 "${pkgdir}"/usr/bin

  echo -e "#!/bin/sh\nexec /usr/lib/${pkgname}/language_server.sh" > "${pkgdir}"/usr/bin/elixir-ls
  echo -e "#!/bin/sh\nexec /usr/lib/${pkgname}/debugger.sh" > "${pkgdir}"/usr/bin/elixir-ls-debug

  chmod +x "${pkgdir}"/usr/bin/*
}
