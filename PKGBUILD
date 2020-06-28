# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>
pkgname=elixir-ls
pkgver=0.5.0
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache')
arch=('any')
depends=('elixir' 'erlang-nox')
source=("elixir-ls-${pkgver}.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v${pkgver}.tar.gz")
sha256sums=('a5d99c61f87628880fdeab3955d74f70727bb1e915e513fcd239210df69494b3')

build() {
  cd "${pkgname}-${pkgver}"

  export MIX_ENV=prod

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
