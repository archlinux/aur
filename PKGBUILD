# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.6.3
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git')
source=("elixir-ls-${pkgver}.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v${pkgver}.tar.gz")
sha256sums=('228d6c49cf2766614d22dafb69974ec4918b2968235456bb7929ce7932011c47')

build() {
  cd "${pkgname}-${pkgver}"

  export MIX_ENV=prod
  export MIX_HOME="${srcdir}/mix-cache"

  # Fetch hex+rebar for deps.get to work
  mix local.hex --force
  mix local.rebar --force

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
